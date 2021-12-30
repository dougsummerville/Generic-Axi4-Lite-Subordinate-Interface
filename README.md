# Generic-Axi4-Lite-Subordinate-Interface
An AXI4-Lite Interface IP that can be used as a building block to build subordinate peripherals.  

The IP presents an AXI-Lite4 port to the AXI Manager and two BRAM HDL ports to the Subordinate, shown in the following figure.  The figure shows how the interface can be connected to a dual-port BRAMThe BRAM.  The BRAM HDL ports, which are shown expanded in the figure, can be connected to generic Subordinate designs that do not use the Xilinx interface.

![image](https://user-images.githubusercontent.com/64434702/147782637-d3dbdc7b-debc-478c-9987-aa1d3360fdc5.png)

The subordinate read port comprises the following signals from Manager to Subordinate: read enable (M->S), read_address, active-low reset and clock (clk).  The clock signal is the same as thew AXI bus clock.  The read address is to the Subordinates address space and is relative to the memory offset to which the Subordinate is assigned.  The read port also contains the read_data signal, which is output from the Subordinate.  The module can be configured to handle synchronous or asynchronous Subordinate reads and can run at full bus throughput for either case.

The write port is output only and comprises the following signals: write_strobe (which is the size, in bytes, of the width of the AXI bus), write_address (which is relative to theSubordinate address space), write_date (which has width of the AXI bus), an active-high  write_enable to indicate when a write is occurring, and reset and clock signals (as above).

To use the IP, download the IP_REPO folder and include it in the IP paths for your Vivado project.
 
