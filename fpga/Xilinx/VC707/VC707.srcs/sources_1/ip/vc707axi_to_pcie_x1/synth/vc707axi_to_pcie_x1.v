// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:axi_pcie:2.8
// IP Revision: 3

(* X_CORE_INFO = "axi_pcie,Vivado 2016.4" *)
(* CHECK_LICENSE_TYPE = "vc707axi_to_pcie_x1,axi_pcie,{}" *)
(* CORE_GENERATION_INFO = "vc707axi_to_pcie_x1,axi_pcie,{x_ipProduct=Vivado 2016.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_pcie,x_ipVersion=2.8,x_ipCoreRevision=3,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_FAMILY=virtex7,C_INSTANCE=vc707axi_to_pcie_x1,C_S_AXI_ID_WIDTH=4,C_S_AXI_ADDR_WIDTH=32,C_S_AXI_DATA_WIDTH=64,C_M_AXI_ADDR_WIDTH=32,C_M_AXI_DATA_WIDTH=64,C_NO_OF_LANES=1,C_MAX_LINK_SPEED=0,C_PCIE_USE_MODE=3.0,C_DEVICE_ID=0x7111,C_VENDOR_ID=0x10EE,C_CLASS_CODE=0x060400,C_REF_CLK_FREQ=0,C_REV_ID=0x00,C_SUBSYSTE\
M_ID=0x0007,C_SUBSYSTEM_VENDOR_ID=0x10EE,C_PCIE_CAP_SLOT_IMPLEMENTED=1,C_SLOT_CLOCK_CONFIG=TRUE,C_MSI_DECODE_ENABLE=TRUE,C_NUM_MSI_REQ=0,C_INTERRUPT_PIN=0,C_COMP_TIMEOUT=1,C_INCLUDE_RC=1,C_S_AXI_SUPPORTS_NARROW_BURST=0,C_INCLUDE_BAROFFSET_REG=1,C_BASEADDR=0x00000000,C_HIGHADDR=0x03FFFFFF,C_AXIBAR_NUM=1,C_AXIBAR2PCIEBAR_0=0x40000000,C_AXIBAR2PCIEBAR_1=0x00000000,C_AXIBAR2PCIEBAR_2=0x00000000,C_AXIBAR2PCIEBAR_3=0x00000000,C_AXIBAR2PCIEBAR_4=0x00000000,C_AXIBAR2PCIEBAR_5=0x00000000,C_AXIBAR_AS_0=1,\
C_AXIBAR_AS_1=0,C_AXIBAR_AS_2=0,C_AXIBAR_AS_3=0,C_AXIBAR_AS_4=0,C_AXIBAR_AS_5=0,C_AXIBAR_0=0x40000000,C_AXIBAR_HIGHADDR_0=0x5FFFFFFF,C_AXIBAR_1=0xFFFFFFFF,C_AXIBAR_HIGHADDR_1=0x00000000,C_AXIBAR_2=0xFFFFFFFF,C_AXIBAR_HIGHADDR_2=0x00000000,C_AXIBAR_3=0xFFFFFFFF,C_AXIBAR_HIGHADDR_3=0x00000000,C_AXIBAR_4=0xFFFFFFFF,C_AXIBAR_HIGHADDR_4=0x00000000,C_AXIBAR_5=0xFFFFFFFF,C_AXIBAR_HIGHADDR_5=0x00000000,C_PCIEBAR_NUM=1,C_PCIEBAR_AS=1,C_PCIEBAR_LEN_0=32,C_PCIEBAR2AXIBAR_0=0x00000000,C_PCIEBAR2AXIBAR_0_SEC\
=1,C_PCIEBAR_LEN_1=16,C_PCIEBAR2AXIBAR_1=0xFFFFFFFF,C_PCIEBAR2AXIBAR_1_SEC=1,C_PCIEBAR_LEN_2=16,C_PCIEBAR2AXIBAR_2=0xFFFFFFFF,C_PCIEBAR2AXIBAR_2_SEC=1,C_PCIE_BLK_LOCN=4,C_XLNX_REF_BOARD=NONE,PCIE_EXT_CLK=FALSE,PCIE_EXT_GT_COMMON=FALSE,EXT_CH_GT_DRP=FALSE,SHARED_LOGIC_IN_CORE=FALSE,TRANSCEIVER_CTRL_STATUS_PORTS=FALSE,EXT_PIPE_INTERFACE=FALSE,C_DEVICE=xc7vx485t,C_SPEED=-2,AXI_ACLK_LOOPBACK=FALSE,NO_SLV_ERR=FALSE,C_RP_BAR_HIDE=TRUE}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module vc707axi_to_pcie_x1 (
  axi_aresetn,
  axi_aclk_out,
  axi_ctl_aclk_out,
  mmcm_lock,
  interrupt_out,
  INTX_MSI_Request,
  INTX_MSI_Grant,
  MSI_enable,
  MSI_Vector_Num,
  MSI_Vector_Width,
  s_axi_awid,
  s_axi_awaddr,
  s_axi_awregion,
  s_axi_awlen,
  s_axi_awsize,
  s_axi_awburst,
  s_axi_awvalid,
  s_axi_awready,
  s_axi_wdata,
  s_axi_wstrb,
  s_axi_wlast,
  s_axi_wvalid,
  s_axi_wready,
  s_axi_bid,
  s_axi_bresp,
  s_axi_bvalid,
  s_axi_bready,
  s_axi_arid,
  s_axi_araddr,
  s_axi_arregion,
  s_axi_arlen,
  s_axi_arsize,
  s_axi_arburst,
  s_axi_arvalid,
  s_axi_arready,
  s_axi_rid,
  s_axi_rdata,
  s_axi_rresp,
  s_axi_rlast,
  s_axi_rvalid,
  s_axi_rready,
  m_axi_awaddr,
  m_axi_awlen,
  m_axi_awsize,
  m_axi_awburst,
  m_axi_awprot,
  m_axi_awvalid,
  m_axi_awready,
  m_axi_awlock,
  m_axi_awcache,
  m_axi_wdata,
  m_axi_wstrb,
  m_axi_wlast,
  m_axi_wvalid,
  m_axi_wready,
  m_axi_bresp,
  m_axi_bvalid,
  m_axi_bready,
  m_axi_araddr,
  m_axi_arlen,
  m_axi_arsize,
  m_axi_arburst,
  m_axi_arprot,
  m_axi_arvalid,
  m_axi_arready,
  m_axi_arlock,
  m_axi_arcache,
  m_axi_rdata,
  m_axi_rresp,
  m_axi_rlast,
  m_axi_rvalid,
  m_axi_rready,
  pci_exp_txp,
  pci_exp_txn,
  pci_exp_rxp,
  pci_exp_rxn,
  REFCLK,
  s_axi_ctl_awaddr,
  s_axi_ctl_awvalid,
  s_axi_ctl_awready,
  s_axi_ctl_wdata,
  s_axi_ctl_wstrb,
  s_axi_ctl_wvalid,
  s_axi_ctl_wready,
  s_axi_ctl_bresp,
  s_axi_ctl_bvalid,
  s_axi_ctl_bready,
  s_axi_ctl_araddr,
  s_axi_ctl_arvalid,
  s_axi_ctl_arready,
  s_axi_ctl_rdata,
  s_axi_ctl_rresp,
  s_axi_ctl_rvalid,
  s_axi_ctl_rready
);

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.axi_aresetn RST" *)
input wire axi_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.axi_aclk_out CLK" *)
output wire axi_aclk_out;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.axi_ctl_aclk_out CLK" *)
output wire axi_ctl_aclk_out;
output wire mmcm_lock;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTERRUPT.interrupt_out INTERRUPT" *)
output wire interrupt_out;
input wire INTX_MSI_Request;
output wire INTX_MSI_Grant;
output wire MSI_enable;
input wire [4 : 0] MSI_Vector_Num;
output wire [2 : 0] MSI_Vector_Width;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *)
input wire [3 : 0] s_axi_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
input wire [31 : 0] s_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *)
input wire [3 : 0] s_axi_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *)
input wire [7 : 0] s_axi_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *)
input wire [2 : 0] s_axi_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *)
input wire [1 : 0] s_axi_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
input wire s_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
output wire s_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
input wire [63 : 0] s_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
input wire [7 : 0] s_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *)
input wire s_axi_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
input wire s_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
output wire s_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BID" *)
output wire [3 : 0] s_axi_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
output wire [1 : 0] s_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
output wire s_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
input wire s_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *)
input wire [3 : 0] s_axi_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
input wire [31 : 0] s_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *)
input wire [3 : 0] s_axi_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *)
input wire [7 : 0] s_axi_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *)
input wire [2 : 0] s_axi_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *)
input wire [1 : 0] s_axi_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
input wire s_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
output wire s_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RID" *)
output wire [3 : 0] s_axi_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
output wire [63 : 0] s_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
output wire [1 : 0] s_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *)
output wire s_axi_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
output wire s_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
input wire s_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *)
output wire [31 : 0] m_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *)
output wire [7 : 0] m_axi_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *)
output wire [2 : 0] m_axi_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *)
output wire [1 : 0] m_axi_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *)
output wire [2 : 0] m_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *)
output wire m_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *)
input wire m_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *)
output wire m_axi_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *)
output wire [3 : 0] m_axi_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *)
output wire [63 : 0] m_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
output wire [7 : 0] m_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *)
output wire m_axi_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *)
output wire m_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *)
input wire m_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *)
input wire [1 : 0] m_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *)
input wire m_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *)
output wire m_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *)
output wire [31 : 0] m_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *)
output wire [7 : 0] m_axi_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *)
output wire [2 : 0] m_axi_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *)
output wire [1 : 0] m_axi_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *)
output wire [2 : 0] m_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *)
output wire m_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *)
input wire m_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *)
output wire m_axi_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *)
output wire [3 : 0] m_axi_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *)
input wire [63 : 0] m_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *)
input wire [1 : 0] m_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *)
input wire m_axi_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *)
input wire m_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *)
output wire m_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt txp" *)
output wire [0 : 0] pci_exp_txp;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt txn" *)
output wire [0 : 0] pci_exp_txn;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt rxp" *)
input wire [0 : 0] pci_exp_rxp;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt rxn" *)
input wire [0 : 0] pci_exp_rxn;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.REFCLK CLK" *)
input wire REFCLK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL AWADDR" *)
input wire [31 : 0] s_axi_ctl_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL AWVALID" *)
input wire s_axi_ctl_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL AWREADY" *)
output wire s_axi_ctl_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL WDATA" *)
input wire [31 : 0] s_axi_ctl_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL WSTRB" *)
input wire [3 : 0] s_axi_ctl_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL WVALID" *)
input wire s_axi_ctl_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL WREADY" *)
output wire s_axi_ctl_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL BRESP" *)
output wire [1 : 0] s_axi_ctl_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL BVALID" *)
output wire s_axi_ctl_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL BREADY" *)
input wire s_axi_ctl_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL ARADDR" *)
input wire [31 : 0] s_axi_ctl_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL ARVALID" *)
input wire s_axi_ctl_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL ARREADY" *)
output wire s_axi_ctl_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL RDATA" *)
output wire [31 : 0] s_axi_ctl_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL RRESP" *)
output wire [1 : 0] s_axi_ctl_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL RVALID" *)
output wire s_axi_ctl_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CTL RREADY" *)
input wire s_axi_ctl_rready;

  axi_pcie #(
    .C_FAMILY("virtex7"),
    .C_INSTANCE("vc707axi_to_pcie_x1"),
    .C_S_AXI_ID_WIDTH(4),
    .C_S_AXI_ADDR_WIDTH(32),
    .C_S_AXI_DATA_WIDTH(64),
    .C_M_AXI_ADDR_WIDTH(32),
    .C_M_AXI_DATA_WIDTH(64),
    .C_NO_OF_LANES(1),
    .C_MAX_LINK_SPEED(0),
    .C_PCIE_USE_MODE("3.0"),
    .C_DEVICE_ID('H7111),
    .C_VENDOR_ID('H10EE),
    .C_CLASS_CODE('H060400),
    .C_REF_CLK_FREQ(0),
    .C_REV_ID('H00),
    .C_SUBSYSTEM_ID('H0007),
    .C_SUBSYSTEM_VENDOR_ID('H10EE),
    .C_PCIE_CAP_SLOT_IMPLEMENTED(1),
    .C_SLOT_CLOCK_CONFIG("TRUE"),
    .C_MSI_DECODE_ENABLE("TRUE"),
    .C_NUM_MSI_REQ(0),
    .C_INTERRUPT_PIN(0),
    .C_COMP_TIMEOUT(1),
    .C_INCLUDE_RC(1),
    .C_S_AXI_SUPPORTS_NARROW_BURST(0),
    .C_INCLUDE_BAROFFSET_REG(1),
    .C_BASEADDR('H00000000),
    .C_HIGHADDR('H03FFFFFF),
    .C_AXIBAR_NUM(1),
    .C_AXIBAR2PCIEBAR_0('H40000000),
    .C_AXIBAR2PCIEBAR_1('H00000000),
    .C_AXIBAR2PCIEBAR_2('H00000000),
    .C_AXIBAR2PCIEBAR_3('H00000000),
    .C_AXIBAR2PCIEBAR_4('H00000000),
    .C_AXIBAR2PCIEBAR_5('H00000000),
    .C_AXIBAR_AS_0(1),
    .C_AXIBAR_AS_1(0),
    .C_AXIBAR_AS_2(0),
    .C_AXIBAR_AS_3(0),
    .C_AXIBAR_AS_4(0),
    .C_AXIBAR_AS_5(0),
    .C_AXIBAR_0('H40000000),
    .C_AXIBAR_HIGHADDR_0('H5FFFFFFF),
    .C_AXIBAR_1('HFFFFFFFF),
    .C_AXIBAR_HIGHADDR_1('H00000000),
    .C_AXIBAR_2('HFFFFFFFF),
    .C_AXIBAR_HIGHADDR_2('H00000000),
    .C_AXIBAR_3('HFFFFFFFF),
    .C_AXIBAR_HIGHADDR_3('H00000000),
    .C_AXIBAR_4('HFFFFFFFF),
    .C_AXIBAR_HIGHADDR_4('H00000000),
    .C_AXIBAR_5('HFFFFFFFF),
    .C_AXIBAR_HIGHADDR_5('H00000000),
    .C_PCIEBAR_NUM(1),
    .C_PCIEBAR_AS(1),
    .C_PCIEBAR_LEN_0(32),
    .C_PCIEBAR2AXIBAR_0('H00000000),
    .C_PCIEBAR2AXIBAR_0_SEC(1),
    .C_PCIEBAR_LEN_1(16),
    .C_PCIEBAR2AXIBAR_1('HFFFFFFFF),
    .C_PCIEBAR2AXIBAR_1_SEC(1),
    .C_PCIEBAR_LEN_2(16),
    .C_PCIEBAR2AXIBAR_2('HFFFFFFFF),
    .C_PCIEBAR2AXIBAR_2_SEC(1),
    .C_PCIE_BLK_LOCN("4"),
    .C_XLNX_REF_BOARD("NONE"),
    .PCIE_EXT_CLK("FALSE"),
    .PCIE_EXT_GT_COMMON("FALSE"),
    .EXT_CH_GT_DRP("FALSE"),
    .SHARED_LOGIC_IN_CORE("FALSE"),
    .TRANSCEIVER_CTRL_STATUS_PORTS("FALSE"),
    .EXT_PIPE_INTERFACE("FALSE"),
    .C_DEVICE("xc7vx485t"),
    .C_SPEED("-2"),
    .AXI_ACLK_LOOPBACK("FALSE"),
    .NO_SLV_ERR("FALSE"),
    .C_RP_BAR_HIDE("TRUE")
  ) inst (
    .axi_aclk(1'B0),
    .axi_aresetn(axi_aresetn),
    .axi_aclk_out(axi_aclk_out),
    .axi_ctl_aclk(1'B0),
    .axi_ctl_aclk_out(axi_ctl_aclk_out),
    .mmcm_lock(mmcm_lock),
    .interrupt_out(interrupt_out),
    .INTX_MSI_Request(INTX_MSI_Request),
    .INTX_MSI_Grant(INTX_MSI_Grant),
    .MSI_enable(MSI_enable),
    .MSI_Vector_Num(MSI_Vector_Num),
    .MSI_Vector_Width(MSI_Vector_Width),
    .s_axi_awid(s_axi_awid),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awregion(s_axi_awregion),
    .s_axi_awlen(s_axi_awlen),
    .s_axi_awsize(s_axi_awsize),
    .s_axi_awburst(s_axi_awburst),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wlast(s_axi_wlast),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bid(s_axi_bid),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_arid(s_axi_arid),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arregion(s_axi_arregion),
    .s_axi_arlen(s_axi_arlen),
    .s_axi_arsize(s_axi_arsize),
    .s_axi_arburst(s_axi_arburst),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rid(s_axi_rid),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rlast(s_axi_rlast),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .m_axi_awaddr(m_axi_awaddr),
    .m_axi_awlen(m_axi_awlen),
    .m_axi_awsize(m_axi_awsize),
    .m_axi_awburst(m_axi_awburst),
    .m_axi_awprot(m_axi_awprot),
    .m_axi_awvalid(m_axi_awvalid),
    .m_axi_awready(m_axi_awready),
    .m_axi_awlock(m_axi_awlock),
    .m_axi_awcache(m_axi_awcache),
    .m_axi_wdata(m_axi_wdata),
    .m_axi_wstrb(m_axi_wstrb),
    .m_axi_wlast(m_axi_wlast),
    .m_axi_wvalid(m_axi_wvalid),
    .m_axi_wready(m_axi_wready),
    .m_axi_bresp(m_axi_bresp),
    .m_axi_bvalid(m_axi_bvalid),
    .m_axi_bready(m_axi_bready),
    .m_axi_araddr(m_axi_araddr),
    .m_axi_arlen(m_axi_arlen),
    .m_axi_arsize(m_axi_arsize),
    .m_axi_arburst(m_axi_arburst),
    .m_axi_arprot(m_axi_arprot),
    .m_axi_arvalid(m_axi_arvalid),
    .m_axi_arready(m_axi_arready),
    .m_axi_arlock(m_axi_arlock),
    .m_axi_arcache(m_axi_arcache),
    .m_axi_rdata(m_axi_rdata),
    .m_axi_rresp(m_axi_rresp),
    .m_axi_rlast(m_axi_rlast),
    .m_axi_rvalid(m_axi_rvalid),
    .m_axi_rready(m_axi_rready),
    .pci_exp_txp(pci_exp_txp),
    .pci_exp_txn(pci_exp_txn),
    .pci_exp_rxp(pci_exp_rxp),
    .pci_exp_rxn(pci_exp_rxn),
    .REFCLK(REFCLK),
    .s_axi_ctl_awaddr(s_axi_ctl_awaddr),
    .s_axi_ctl_awvalid(s_axi_ctl_awvalid),
    .s_axi_ctl_awready(s_axi_ctl_awready),
    .s_axi_ctl_wdata(s_axi_ctl_wdata),
    .s_axi_ctl_wstrb(s_axi_ctl_wstrb),
    .s_axi_ctl_wvalid(s_axi_ctl_wvalid),
    .s_axi_ctl_wready(s_axi_ctl_wready),
    .s_axi_ctl_bresp(s_axi_ctl_bresp),
    .s_axi_ctl_bvalid(s_axi_ctl_bvalid),
    .s_axi_ctl_bready(s_axi_ctl_bready),
    .s_axi_ctl_araddr(s_axi_ctl_araddr),
    .s_axi_ctl_arvalid(s_axi_ctl_arvalid),
    .s_axi_ctl_arready(s_axi_ctl_arready),
    .s_axi_ctl_rdata(s_axi_ctl_rdata),
    .s_axi_ctl_rresp(s_axi_ctl_rresp),
    .s_axi_ctl_rvalid(s_axi_ctl_rvalid),
    .s_axi_ctl_rready(s_axi_ctl_rready),
    .qpll_drp_crscode(12'B0),
    .qpll_drp_fsm(18'B0),
    .qpll_drp_done(2'B0),
    .qpll_drp_reset(2'B0),
    .qpll_qplllock(2'B0),
    .qpll_qplloutclk(2'B0),
    .qpll_qplloutrefclk(2'B0),
    .qpll_qplld(),
    .qpll_qpllreset(),
    .qpll_drp_clk(),
    .qpll_drp_rst_n(),
    .qpll_drp_ovrd(),
    .qpll_drp_gen3(),
    .qpll_drp_start(),
    .pipe_txprbssel(3'B0),
    .pipe_rxprbssel(3'B0),
    .pipe_txprbsforceerr(1'B0),
    .pipe_rxprbscntreset(1'B0),
    .pipe_loopback(3'B0),
    .pipe_rxprbserr(),
    .pipe_txinhibit(1'B0),
    .pipe_rst_fsm(),
    .pipe_qrst_fsm(),
    .pipe_rate_fsm(),
    .pipe_sync_fsm_tx(),
    .pipe_sync_fsm_rx(),
    .pipe_drp_fsm(),
    .pipe_rst_idle(),
    .pipe_qrst_idle(),
    .pipe_rate_idle(),
    .pipe_eyescandataerror(),
    .pipe_rxstatus(),
    .pipe_dmonitorout(),
    .pipe_cpll_lock(),
    .pipe_qpll_lock(),
    .pipe_rxpmaresetdone(),
    .pipe_rxbufstatus(),
    .pipe_txphaligndone(),
    .pipe_txphinitdone(),
    .pipe_txdlysresetdone(),
    .pipe_rxphaligndone(),
    .pipe_rxdlysresetdone(),
    .pipe_rxsyncdone(),
    .pipe_rxdisperr(),
    .pipe_rxnotintable(),
    .pipe_rxcommadet(),
    .gt_ch_drp_rdy(),
    .pipe_debug_0(),
    .pipe_debug_1(),
    .pipe_debug_2(),
    .pipe_debug_3(),
    .pipe_debug_4(),
    .pipe_debug_5(),
    .pipe_debug_6(),
    .pipe_debug_7(),
    .pipe_debug_8(),
    .pipe_debug_9(),
    .pipe_debug(),
    .int_pclk_out_slave(),
    .int_rxusrclk_out(),
    .int_dclk_out(),
    .int_userclk1_out(),
    .int_userclk2_out(),
    .int_oobclk_out(),
    .int_mmcm_lock_out(),
    .int_qplllock_out(),
    .int_qplloutclk_out(),
    .int_qplloutrefclk_out(),
    .int_rxoutclk_out(),
    .int_pclk_sel_slave(1'B0),
    .ext_ch_gt_drpclk(),
    .ext_ch_gt_drpaddr(9'B0),
    .ext_ch_gt_drpen(1'B0),
    .ext_ch_gt_drpdi(16'B0),
    .ext_ch_gt_drpwe(1'B0),
    .ext_ch_gt_drpdo(),
    .ext_ch_gt_drprdy(),
    .clk_fab_refclk(1'B0),
    .clk_pclk(1'B0),
    .clk_rxusrclk(1'B0),
    .clk_dclk(1'B0),
    .clk_userclk1(1'B1),
    .clk_userclk2(1'B0),
    .clk_oobclk_in(1'B0),
    .clk_mmcm_lock(1'B1),
    .clk_txoutclk(),
    .clk_rxoutclk(),
    .clk_pclk_sel(),
    .clk_gen3(),
    .pipe_mmcm_rst_n(1'B1),
    .common_commands_in(12'B0),
    .pipe_rx_0_sigs(25'B0),
    .pipe_rx_1_sigs(25'B0),
    .pipe_rx_2_sigs(25'B0),
    .pipe_rx_3_sigs(25'B0),
    .pipe_rx_4_sigs(25'B0),
    .pipe_rx_5_sigs(25'B0),
    .pipe_rx_6_sigs(25'B0),
    .pipe_rx_7_sigs(25'B0),
    .common_commands_out(),
    .pipe_tx_0_sigs(),
    .pipe_tx_1_sigs(),
    .pipe_tx_2_sigs(),
    .pipe_tx_3_sigs(),
    .pipe_tx_4_sigs(),
    .pipe_tx_5_sigs(),
    .pipe_tx_6_sigs(),
    .pipe_tx_7_sigs()
  );
endmodule
