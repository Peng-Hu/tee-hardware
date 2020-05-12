package uec.teehardware.devices.random

import chisel3._
import chisel3.util._
import chisel3.util.random._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.interrupts._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.util._

case class RandomParams(address: BigInt)

class RandomPortIO extends Bundle {
}

abstract class Random(busWidthBytes: Int, val c: RandomParams)
                   (implicit p: Parameters)
  extends IORegisterRouter(
    RegisterRouterParams(
      name = "random",
      compat = Seq("uec,random"),
      base = c.address,
      beatBytes = busWidthBytes),
    new RandomPortIO
  )
    with HasInterruptSources {
  def nInterrupts = 4

  // The device in the dts is created here
  ResourceBinding {
    Resource(ResourceAnchors.aliases, "random").bind(ResourceAlias(device.label))
  }

  lazy val module = new LazyModuleImp(this) {

    // Interrupt registers
    val vn_err_int_mask = RegInit(true.B)
    val crngt_err_int_mask = RegInit(true.B)
    val autocorr_err_int_mask = RegInit(true.B)
    val ehr_valid_int_mask = RegInit(true.B)

    val vn_err = RegInit(false.B)
    val crngt_err = RegInit(false.B)
    val autocorr_err = RegInit(false.B)
    val ehr_valid_int = RegInit(false.B)

    val vn_err_clear = WireInit(false.B)
    val crngt_err_clear = WireInit(false.B)
    val autocorr_err_clear = WireInit(false.B)
    val ehr_valid_clear = WireInit(false.B)

    // Clear interrupt logic
    when(vn_err_clear) { vn_err := false.B }
    when(crngt_err_clear) { crngt_err := false.B }
    when(autocorr_err_clear) { autocorr_err := false.B }
    when(ehr_valid_clear) { ehr_valid_int := false.B }

    // Interrupt export
    interrupts(3) := vn_err
    interrupts(2) := crngt_err
    interrupts(1) := autocorr_err
    interrupts(0) := ehr_valid_int

    // Interrupt register mapping
    val int_map = Seq(
      RandomRegs.rng_imr -> Seq(
        RegField(1, ehr_valid_int_mask, RegFieldDesc("ehr_valid_int_mask", "192-bit sampling interrupt mask", reset = Some(1))),
        RegField(1, autocorr_err_int_mask, RegFieldDesc("autocorr_err_int_mask", "Autocorrelation error interrupt mask", reset = Some(1))),
        RegField(1, crngt_err_int_mask, RegFieldDesc("crngt_err_int_mask", "CRNGT error interrupt mask", reset = Some(1))),
        RegField(1, vn_err_int_mask, RegFieldDesc("vn_err_int_mask", "Von Neumann error interrupt mask", reset = Some(1)))
      ),
      RandomRegs.rng_isr -> Seq(
        RegField.r(1, ehr_valid_int, RegFieldDesc("ehr_valid", "192-bit sampling interrupt status", volatile = true)),
        RegField.r(1, autocorr_err, RegFieldDesc("autocorr_err", "Autocorrelation error interrupt status", volatile = true)),
        RegField.r(1, crngt_err, RegFieldDesc("crngt_err", "CRNGT error interrupt status", volatile = true)),
        RegField.r(1, vn_err, RegFieldDesc("vn_err", "Von Neumann error interrupt status", volatile = true))
      ),
      RandomRegs.rng_icr -> Seq(
        RegField(1, ehr_valid_clear, RegFieldDesc("ehr_valid_clear", "192-bit sampling interrupt clear", reset = Some(0))),
        RegField(1, autocorr_err_clear, RegFieldDesc("autocorr_err_clear", "Autocorrelation error interrupt clear", reset = Some(0))),
        RegField(1, crngt_err_clear, RegFieldDesc("crngt_err_clear", "CRNGT error interrupt clear", reset = Some(0))),
        RegField(1, vn_err_clear, RegFieldDesc("vn_err_clear", "Von Neumann error interrupt clear", reset = Some(0)))
      )
    )

    // TRNG
    val rnd_src_sel = RegInit(0.U(2.W)) // TODO: Unused. Please use this (and maybe declare more)
    val rnd_src_en = RegInit(false.B)
    val ehr_valid = RegInit(false.B)
    val ehr_data = RegInit(0.U(192.W))
    val sample_cnt1 = RegInit(0xFFFF.U(32.W))
    val autocorr_fails = RegInit(0.U(8.W)) // TODO: Not used
    val autocorr_trys = RegInit(0.U(14.W)) // TODO: Not used
    val auto_correlate_bypass = RegInit(false.B) // TODO: Not used
    val trng_crngt_bypass = RegInit(false.B) // TODO: Not used
    val vnc_bypass = RegInit(false.B) // TODO: Not used
    val trng_sw_reset = WireInit(false.B)
    val trng_busy = RegInit(false.B)
    val rst_bits_counter = WireInit(false.B)
    val rng_bist_cntr = RegInit(VecInit(Seq.fill(3)(0.U(22.W)))) // TODO: Not used

    // TRNG sampling logic
    val rnd_gen = LFSR(16, rnd_src_en) // This is the generator, for now

    val trng_bit_counter = RegInit(0.U(8.W))
    val trng_sample_counter = RegInit(0.U(32.W))

    when(rnd_src_en && trng_bit_counter < 192.U) {
      trng_busy := true.B
      trng_sample_counter := trng_sample_counter + 1.U
      when(trng_sample_counter >= sample_cnt1) {
        // Here is the sample enable. As long the sampler is enabled
        // and also the LFSR, we count 16 bits up, and shift them
        trng_sample_counter := 0.U
        ehr_data := Cat(ehr_data, rnd_gen)
        trng_bit_counter := trng_bit_counter + 16.U
      }
    }

    when(trng_bit_counter >= 192.U) {
      trng_busy := false.B
      when(ehr_valid_int_mask) { ehr_valid_int := true.B }
      ehr_valid := true.B
    }

    when(rst_bits_counter || trng_sw_reset) {
      trng_bit_counter := 0.U
      trng_sample_counter := 0.U
      ehr_valid := false.B
      trng_busy := false.B
    }

    when(trng_sw_reset) {
      ehr_data := 0.U
    }

    // TRNG register mapping
    val trng_map = Seq(
      RandomRegs.trng_config -> Seq(
        RegField(2, rnd_src_sel, RegFieldDesc("rnd_src_sel", "TRNG loop select", reset = Some(0)))
      ),
      RandomRegs.trng_valid -> Seq(
        RegField.r(1, ehr_valid, RegFieldDesc("ehr_valid", "192-bit sampling valid", volatile = true))
      ),
      RandomRegs.ehr_data0 -> Seq(
        RegField.r(32, ehr_data(31, 0), RegFieldDesc("ehr_data0", "Entrophy Holding Register [31:0]", volatile = true)),
        RegField.r(32, ehr_data(63, 32), RegFieldDesc("ehr_data1", "Entrophy Holding Register [63:32]", volatile = true)),
        RegField.r(32, ehr_data(95, 64), RegFieldDesc("ehr_data2", "Entrophy Holding Register [95:64]", volatile = true)),
        RegField.r(32, ehr_data(127, 96), RegFieldDesc("ehr_data3", "Entrophy Holding Register [127:96]", volatile = true)),
        RegField.r(32, ehr_data(159, 128), RegFieldDesc("ehr_data4", "Entrophy Holding Register [159:128]", volatile = true)),
        RegField.r(32, ehr_data(191, 160), RegFieldDesc("ehr_data5", "Entrophy Holding Register [191:160]", volatile = true))
      ),
      RandomRegs.rnd_source_enable -> Seq(
        RegField(1, rnd_src_en, RegFieldDesc("rnd_src_en", "TRNG entropy source enable", reset = Some(0)))
      ),
      RandomRegs.sample_cnt1 -> Seq(
        RegField(32, sample_cnt1, RegFieldDesc("sample_cnt1", "Sampling counter register", reset = Some(0xFFFF)))
      ),
      RandomRegs.autocorr_statistic -> Seq(
        RegField(14, autocorr_trys, RegFieldDesc("autocorr_trys", "Autocorrelation trys", reset = Some(0), volatile = true)),
        RegField(8, autocorr_fails, RegFieldDesc("autocorr_fails", "Autocorrelation fails", reset = Some(0), volatile = true))
      ),
      RandomRegs.trng_debug_control -> Seq(
        RegField(1),
        RegField(1, vnc_bypass, RegFieldDesc("vnc_bypass", "Von Neumann balancer bypass", reset = Some(0))),
        RegField(1, trng_crngt_bypass, RegFieldDesc("trng_crngt_bypass", "CRNGT test bypass", reset = Some(0))),
        RegField(1, auto_correlate_bypass, RegFieldDesc("auto_correlate_bypass", "Auto correlate bypass", reset = Some(0)))
      ),
      RandomRegs.trng_sw_reset -> Seq(
        RegField(1, trng_sw_reset, RegFieldDesc("trng_sw_reset", "TRNG internal reset", reset = Some(0)))
      ),
      RandomRegs.trng_busy -> Seq(
        RegField.r(1, trng_busy, RegFieldDesc("trng_busy", "TRNG busy", volatile = true))
      ),
      RandomRegs.rst_bits_counter -> Seq(
        RegField(1, rst_bits_counter, RegFieldDesc("rst_bits_counter", "Reset Bits Counter", reset = Some(0)))
      ),
      RandomRegs.rng_bist_cntr0 -> Seq(
        RegField(22, rng_bist_cntr(0), RegFieldDesc("rng_bist_cntr_0", "TRNG BIST counter 0", reset = Some(0)))
      ),
      RandomRegs.rng_bist_cntr1 -> Seq(
        RegField(22, rng_bist_cntr(1), RegFieldDesc("rng_bist_cntr_1", "TRNG BIST counter 1", reset = Some(0)))
      ),
      RandomRegs.rng_bist_cntr2 -> Seq(
        RegField(22, rng_bist_cntr(2), RegFieldDesc("rng_bist_cntr_2", "TRNG BIST counter 2", reset = Some(0)))
      )
    )
    regmap(
      (int_map ++ trng_map):_*
    )
  }
}

class TLRandom(busWidthBytes: Int, params: RandomParams)(implicit p: Parameters)
  extends Random(busWidthBytes, params) with HasTLControlRegMap

case class RandomAttachParams(
   sha3par: RandomParams,
   controlBus: TLBusWrapper,
   intNode: IntInwardNode,
   controlXType: ClockCrossingType = NoCrossing,
   intXType: ClockCrossingType = NoCrossing,
   mclock: Option[ModuleValue[Clock]] = None,
   mreset: Option[ModuleValue[Bool]] = None)
 (implicit val p: Parameters)

object Random {
  val nextId = {
    var i = -1; () => {
      i += 1; i
    }
  }

  def attach(params: RandomAttachParams): TLRandom = {
    implicit val p = params.p
    val name = s"random ${nextId()}"
    val cbus = params.controlBus
    val rnd = LazyModule(new TLRandom(cbus.beatBytes, params.sha3par))
    rnd.suggestName(name)

    cbus.coupleTo(s"device_named_$name") {
      rnd.controlXing(params.controlXType) := TLFragmenter(cbus.beatBytes, cbus.blockBytes) := _
    }
    params.intNode := rnd.intXing(params.intXType)
    InModuleBody {
      rnd.module.clock := params.mclock.map(_.getWrappedValue).getOrElse(cbus.module.clock)
    }
    InModuleBody {
      rnd.module.reset := params.mreset.map(_.getWrappedValue).getOrElse(cbus.module.reset)
    }

    rnd
  }
}