module	wbarbiter(i_clk, i_reset,
	// Bus A -- the priority bus
	i_a_cyc, i_a_stb, i_a_we, i_a_adr, i_a_dat, i_a_sel,
		o_a_ack, o_a_stall, o_a_err,
	// Bus B
	i_b_cyc, i_b_stb, i_b_we, i_b_adr, i_b_dat, i_b_sel,
		o_b_ack, o_b_stall, o_b_err,
	// Combined/arbitrated bus
	o_cyc, o_stb, o_we, o_adr, o_dat, o_sel, i_ack, i_stall, i_err
	);
	parameter			DW=32, AW=32;
	parameter			SCHEME="ALTERNATING";
	parameter	[0:0]	OPT_ZERO_ON_IDLE = 1'b0;
	parameter			F_MAX_STALL = 3;
	parameter			F_MAX_ACK_DELAY = 3;
	parameter			F_LGDEPTH=3;

	//
	input	wire			i_clk, i_reset;
	// Bus A
	input	wire			i_a_cyc, i_a_stb, i_a_we;
	input	wire	[(AW-1):0]	i_a_adr;
	input	wire	[(DW-1):0]	i_a_dat;
	input	wire	[(DW/8-1):0]	i_a_sel;
	output	wire			o_a_ack, o_a_stall, o_a_err;
	// Bus B
	input	wire			i_b_cyc, i_b_stb, i_b_we;
	input	wire	[(AW-1):0]	i_b_adr;
	input	wire	[(DW-1):0]	i_b_dat;
	input	wire	[(DW/8-1):0]	i_b_sel;
	output	wire			o_b_ack, o_b_stall, o_b_err;
	//
	output	wire			o_cyc, o_stb, o_we;
	output	wire	[(AW-1):0]	o_adr;
	output	wire	[(DW-1):0]	o_dat;
	output	wire	[(DW/8-1):0]	o_sel;
	input	wire			i_ack, i_stall, i_err;
	//

	// Go high immediately (new cycle) if ...
	//	Previous cycle was low and *someone* is requesting a bus cycle
	// Go low immadiately if ...
	//	We were just high and the owner no longer wants the bus
	// WISHBONE Spec recommends no logic between a FF and the o_cyc
	//	This violates that spec.  (Rec 3.15, p35)
	reg	r_a_owner;

	assign o_cyc = (r_a_owner) ? i_a_cyc : i_b_cyc;
	initial	r_a_owner = 1'b1;

	generate if (SCHEME == "PRIORITY")
	begin : PRI

		always @(posedge i_clk)
			if (!i_b_cyc)
				r_a_owner <= 1'b1;
			// Allow B to set its CYC line w/o activating this
			// interface
			else if ((i_b_stb)&&(!i_a_cyc))
				r_a_owner <= 1'b0;

	end else if (SCHEME == "ALTERNATING")
	begin : ALT

		reg	last_owner;
		initial	last_owner = 1'b0;
		always @(posedge i_clk)
			if ((i_a_cyc)&&(r_a_owner))
				last_owner <= 1'b1;
			else if ((i_b_cyc)&&(!r_a_owner))
				last_owner <= 1'b0;

		always @(posedge i_clk)
			if ((!i_a_cyc)&&(!i_b_cyc))
				r_a_owner <= !last_owner;
			else if ((r_a_owner)&&(!i_a_cyc))
			begin

				if (i_b_stb)
					r_a_owner <= 1'b0;

			end else if ((!r_a_owner)&&(!i_b_cyc))
			begin

				if (i_a_stb)
					r_a_owner <= 1'b1;

			end

	end else // if (SCHEME == "LAST")
	begin : LST
		always @(posedge i_clk)
			if ((!i_a_cyc)&&(i_b_stb))
				r_a_owner <= 1'b0;
			else if ((!i_b_cyc)&&(i_a_stb))
				r_a_owner <= 1'b1;
	end endgenerate


	// Realistically, if neither master owns the bus, the output is a
	// don't care.  Thus we trigger off whether or not 'A' owns the bus.
	// If 'B' owns it all we care is that 'A' does not.  Likewise, if
	// neither owns the bus than the values on the various lines are
	// irrelevant.
	assign o_we  = (r_a_owner) ? i_a_we  : i_b_we;

	generate if (OPT_ZERO_ON_IDLE)
	begin
		//
		// OPT_ZERO_ON_IDLE will use up more logic and may even slow
		// down the master clock if set.  However, it may also reduce
		// the power used by the FPGA by preventing things from toggling
		// when the bus isn't in use.  The option is here because it
		// also makes it a lot easier to look for when things happen
		// on the bus via VERILATOR when timing and logic counts
		// don't matter.
		//
		assign o_stb     = (o_cyc)? ((r_a_owner) ? i_a_stb : i_b_stb):0;
		assign o_adr     = (o_stb)? ((r_a_owner) ? i_a_adr : i_b_adr):0;
		assign o_dat     = (o_stb)? ((r_a_owner) ? i_a_dat : i_b_dat):0;
		assign o_sel     = (o_stb)? ((r_a_owner) ? i_a_sel : i_b_sel):0;
		assign o_a_ack   = (o_cyc)&&( r_a_owner) ? i_ack   : 1'b0;
		assign o_b_ack   = (o_cyc)&&(!r_a_owner) ? i_ack   : 1'b0;
		assign o_a_stall = (o_cyc)&&( r_a_owner) ? i_stall : 1'b1;
		assign o_b_stall = (o_cyc)&&(!r_a_owner) ? i_stall : 1'b1;
		assign o_a_err   = (o_cyc)&&( r_a_owner) ? i_err : 1'b0;
		assign o_b_err   = (o_cyc)&&(!r_a_owner) ? i_err : 1'b0;
	end else begin

		assign o_stb = (r_a_owner) ? i_a_stb : i_b_stb;
		assign o_adr = (r_a_owner) ? i_a_adr : i_b_adr;
		assign o_dat = (r_a_owner) ? i_a_dat : i_b_dat;
		assign o_sel = (r_a_owner) ? i_a_sel : i_b_sel;

		// We cannot allow the return acknowledgement to ever go high if
		// the master in question does not own the bus.  Hence we force
		// it low if the particular master doesn't own the bus.
		assign	o_a_ack   = ( r_a_owner) ? i_ack   : 1'b0;
		assign	o_b_ack   = (!r_a_owner) ? i_ack   : 1'b0;

		// Stall must be asserted on the same cycle the input master
		// asserts the bus, if the bus isn't granted to him.
		assign	o_a_stall = ( r_a_owner) ? i_stall : 1'b1;
		assign	o_b_stall = (!r_a_owner) ? i_stall : 1'b1;

		//
		//
		assign	o_a_err = ( r_a_owner) ? i_err : 1'b0;
		assign	o_b_err = (!r_a_owner) ? i_err : 1'b0;
	end endgenerate

	// Make Verilator happy
	// verilator lint_off UNUSED
	wire	unused;
	assign	unused = i_reset;
	// verilator lint_on  UNUSED

endmodule
