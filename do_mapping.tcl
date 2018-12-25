# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {flex_counter.sv acceptance_filter.sv AHB_Slave.sv arbitration.sv can_crc.sv can_register.sv Command_FIFO_storage.sv Control_Unit.sv flex_pts_sr.sv flex_stp_sr.sv rx_sr.sv Sensor_FIFO_storage.sv tx_sr.sv AHB2CAN_top.sv}
elaborate AHB2CAN_top -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/AHB2CAN_top.rep
report_area >> reports/AHB2CAN_top.rep
report_power -hier >> reports/AHB2CAN_top.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/AHB2CAN_top.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
