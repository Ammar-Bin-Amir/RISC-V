### =================== ###
### SYSTEMVERILOG FILES ###
### =================== ###

# Program Counter

SRC_PROGRAM_COUNTER = src/program_counter.sv
TB_PROGRAM_COUNTER = tb/tb_program_counter.sv
TOP_PROGRAM_COUNTER = tb_program_counter
VCD_PROGRAM_COUNTER = vcd_program_counter

# ROM

SRC_ROM = src/rom.sv
TB_ROM = tb/tb_rom.sv
TOP_ROM = tb_rom
VCD_ROM = vcd_rom

# Type Decoder

SRC_TYPE_DECODER = src/type_decoder.sv
TB_TYPE_DECODER = tb/tb_type_decoder.sv
TOP_TYPE_DECODER = tb_type_decoder
VCD_TYPE_DECODER = vcd_type_decoder

# Control Decoder

SRC_CONTROL_DECODER = src/control_decoder.sv
TB_CONTROL_DECODER = tb/tb_control_decoder.sv
TOP_CONTROL_DECODER = tb_control_decoder
VCD_CONTROL_DECODER = vcd_control_decoder

# Control Unit

SRC_CONTROL_UNIT = src/control_unit.sv
TB_CONTROL_UNIT = tb/tb_control_unit.sv
TOP_CONTROL_UNIT = tb_control_unit
VCD_CONTROL_UNIT = vcd_control_unit

# Register File

SRC_REGISTER_FILE = src/register_file.sv
TB_REGISTER_FILE = tb/tb_register_file.sv
TOP_REGISTER_FILE = tb_register_file
VCD_REGISTER_FILE = vcd_register_file

# Immediate Generator

SRC_IMMEDIATE_GENERATOR = src/immediate_generator.sv
TB_IMMEDIATE_GENERATOR = tb/tb_immediate_generator.sv
TOP_IMMEDIATE_GENERATOR = tb_immediate_generator
VCD_IMMEDIATE_GENERATOR = vcd_immediate_generator

# ALU

SRC_ALU = src/alu.sv
TB_ALU = tb/tb_alu.sv
TOP_ALU = tb_alu
VCD_ALU = vcd_alu

# RAM

SRC_RAM = src/ram.sv
TB_RAM = tb/tb_ram.sv
TOP_RAM = tb_ram
VCD_RAM = vcd_ram

# Branch Selector

SRC_BRANCH_SELECTOR = src/branch_selector.sv
TB_BRANCH_SELECTOR = tb/tb_branch_selector.sv
TOP_BRANCH_SELECTOR = tb_branch_selector
VCD_BRANCH_SELECTOR = vcd_branch_selector

# TOP

FLIST = flist.txt
SRC = src/top.sv
TB = tb/tb_top.sv
TOP = tb_top
VCD = vcd

### ======== ###
### SETTINGS ###
### ======== ###

# Compilation Settings

COMPILER = xvlog
LANGUAGE_FLAG = -sv
FLIST_FLAG = -f

# Elaboration Settings

ELABORATOR = xelab
DEBUG_FLAG = -debug typical
TOP_MODULE_FLAG = -top
VCD_FLAG = -snapshot
TIMESCALE_FLAG = -timescale
TIMESCALE = "1ns/1ps"

# Simulation Settings

SIMULATOR = xsim
BASH_FLAG = -tclbatch
BASH = xsim_cfg.tcl

### ======= ###
### TARGETS ###
### ======= ###

all: top

everything: program_counter rom type_decoder control_decoder control_unit register_file immediate_generator alu ram branch_selector top

# Target: Program Counter

program_counter: simulate_program_counter

simulate_program_counter: elaborate_program_counter
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_PROGRAM_COUNTER) $(BASH_FLAG) $(BASH)

elaborate_program_counter: compile_program_counter
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_PROGRAM_COUNTER) $(VCD_FLAG) $(VCD_PROGRAM_COUNTER) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_program_counter:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_PROGRAM_COUNTER) $(SRC_PROGRAM_COUNTER)

# Target: ROM

rom: simulate_rom

simulate_rom: elaborate_rom
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_ROM) $(BASH_FLAG) $(BASH)

elaborate_rom: compile_rom
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_ROM) $(VCD_FLAG) $(VCD_ROM) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_rom:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_ROM) $(SRC_ROM)

# Target: Type Decoder

type_decoder: simulate_type_decoder

simulate_type_decoder: elaborate_type_decoder
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_TYPE_DECODER) $(BASH_FLAG) $(BASH)

elaborate_type_decoder: compile_type_decoder
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_TYPE_DECODER) $(VCD_FLAG) $(VCD_TYPE_DECODER) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_type_decoder:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_TYPE_DECODER) $(SRC_TYPE_DECODER)

# Target: Control Decoder

control_decoder: simulate_control_decoder

simulate_control_decoder: elaborate_control_decoder
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_CONTROL_DECODER) $(BASH_FLAG) $(BASH)

elaborate_control_decoder: compile_control_decoder
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_CONTROL_DECODER) $(VCD_FLAG) $(VCD_CONTROL_DECODER) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_control_decoder:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_CONTROL_DECODER) $(SRC_CONTROL_DECODER)

# Target: Control Unit

control_unit: simulate_control_unit

simulate_control_unit: elaborate_control_unit
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_CONTROL_UNIT) $(BASH_FLAG) $(BASH)

elaborate_control_unit: compile_control_unit
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_CONTROL_UNIT) $(VCD_FLAG) $(VCD_CONTROL_UNIT) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_control_unit:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_CONTROL_UNIT) $(SRC_CONTROL_UNIT) $(SRC_TYPE_DECODER) $(SRC_CONTROL_DECODER)

# Target: Register File

register_file: simulate_register_file

simulate_register_file: elaborate_register_file
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_REGISTER_FILE) $(BASH_FLAG) $(BASH)

elaborate_register_file: compile_register_file
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_REGISTER_FILE) $(VCD_FLAG) $(VCD_REGISTER_FILE) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_register_file:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_REGISTER_FILE) $(SRC_REGISTER_FILE)

# Target: Immediate Generator

immediate_generator: simulate_immediate_generator

simulate_immediate_generator: elaborate_immediate_generator
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_IMMEDIATE_GENERATOR) $(BASH_FLAG) $(BASH)

elaborate_immediate_generator: compile_immediate_generator
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_IMMEDIATE_GENERATOR) $(VCD_FLAG) $(VCD_IMMEDIATE_GENERATOR) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_immediate_generator:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_IMMEDIATE_GENERATOR) $(SRC_IMMEDIATE_GENERATOR)

# Target: ALU

alu: simulate_alu

simulate_alu: elaborate_alu
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_ALU) $(BASH_FLAG) $(BASH)

elaborate_alu: compile_alu
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_ALU) $(VCD_FLAG) $(VCD_ALU) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_alu:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_ALU) $(SRC_ALU)

# Target: RAM

ram: simulate_ram

simulate_ram: elaborate_ram
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_RAM) $(BASH_FLAG) $(BASH)

elaborate_ram: compile_ram
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_RAM) $(VCD_FLAG) $(VCD_RAM) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_ram:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB_RAM) $(SRC_RAM)

# Target: Branch Selector

branch_selector: simulate_branch_selector

simulate_branch_selector: elaborate_branch_selector
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD_BRANCH_SELECTOR) $(BASH_FLAG) $(BASH)

elaborate_branch_selector: compile_branch_selector
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP_BRANCH_SELECTOR) $(VCD_FLAG) $(VCD_BRANCH_SELECTOR) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_branch_selector:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(SRC_BRANCH_SELECTOR) $(TB_BRANCH_SELECTOR)

# Target: MAIN

top: simulate_top

simulate_top: elaborate_top
	@echo ""
	@echo "Simulating ..."
	@echo ""
	$(SIMULATOR) $(VCD) $(BASH_FLAG) $(BASH)

elaborate_top: compile_top
	@echo ""
	@echo "Elaborating ..."
	@echo ""
	$(ELABORATOR) $(DEBUG_FLAG) $(TOP_MODULE_FLAG) $(TOP) $(VCD_FLAG) $(VCD) $(TIMESCALE_FLAG) $(TIMESCALE)

compile_top:
	mkdir -p temp
	@echo ""
	@echo "Compiling ..."
	@echo ""
	$(COMPILER) $(LANGUAGE_FLAG) $(TB) $(SRC) $(FLIST_FLAG) $(FLIST)

# Target: Clean

clean:
	rm -rf *.jou *.log *.pb
	rm -rf *.wdb *.wcfg *.str
	rm -rf .*.timestamp
	rm -rf xsim.dir
	rm -rf temp
	rm -rf .Xil

