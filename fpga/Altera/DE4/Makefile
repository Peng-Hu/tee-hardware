#########################################################################################
# TR4 FPGA build (verilog only for now)
#########################################################################################

#########################################################################################
# general path variables
#########################################################################################
base_dir=$(abspath ../../..)
sim_dir=$(abspath .)
build_dir=$(sim_dir)/src

bootrom_dir=$(base_dir)/software/freedom-u540-c000-bootloader
xip_dir=$(base_dir)/software/xip
SUB_PROJECT ?= FPGADE4
ROMGEN ?= $(base_dir)/hardware/vlsi_rom_gen_real

BOARD?=DE4
ISACONF?=RV64GC
MBUS?=MBus64
BOOTSRC?=BOOTROM
PCIE?=WoPCIe
DDRCLK?=WoSepaDDRClk
HYBRID?=BoomRocket
SEPARE?=BoomTile,RocketTile,USB11HS,TLAES,TLed25519,TLSHA3

#########################################################################################
# Common rules for FPGA
#########################################################################################
include $(base_dir)/fpga/common.mk

