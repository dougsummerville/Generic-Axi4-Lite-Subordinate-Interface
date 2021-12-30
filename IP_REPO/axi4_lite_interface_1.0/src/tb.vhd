-- MIT License
--
--Copyright (c) 2021 Douglas H. Summerville, Department of Electical and Computer Engineering, Binghamton University
--
--Permission is hereby granted, free of charge, to any person obtaining a copy
--of this software and associated documentation files (the "Software"), to deal
--in the Software without restriction, including without limitation the rights
--to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--copies of the Software, and to permit persons to whom the Software is
--furnished to do so, subject to the following conditions:

--The above copyright notice and this permission notice shall be included in all
--copies or substantial portions of the Software.

--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--SOFTWARE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity axi4_lite_interface_v1_0_tb is
generic ( ADDR_WIDTH: integer:=2;
DATA_BUS_IS_64_BITS: integer:=0;
USE_WRITE_STROBES: boolean:=true

);
end axi4_lite_interface_v1_0_tb;

architecture arch_imp of axi4_lite_interface_v1_0_tb is

	-- component declaration
	component axi4_lite_interface_v1_0 is
	generic (
        DATA_BUS_IS_64_BITS: integer range 0 to 1 := 0; --0:32b, 1:64b
        --Address space of subordinate, in bits
        ADDR_WIDTH	: integer range 1 to 12	:= 2;
        USE_WRITE_STROBES: boolean :=false
	);
	port (
	--_AXI SUBORDINATE SIGNALS
        SAXI_ACLK	: in std_logic;
        SAXI_ARESETN	: in std_logic;
        SAXI_AWADDR	: in std_logic_vector(31 downto 0);
        SAXI_AWPROT	: in std_logic_vector(2 downto 0);
        SAXI_AWVALID	: in std_logic;
        SAXI_AWREADY	: out std_logic;
        SAXI_WDATA	: in std_logic_vector(32*(1+DATA_BUS_IS_64_BITS) -1 downto 0);
        SAXI_WSTRB	: in std_logic_vector((4*(1+DATA_BUS_IS_64_BITS))-1 downto 0);
        SAXI_WVALID	: in std_logic;
        SAXI_WREADY	: out std_logic;
        SAXI_BRESP	: out std_logic_vector(1 downto 0);
        SAXI_BVALID	: out std_logic;
        SAXI_BREADY	: in std_logic;
        SAXI_ARADDR	: in std_logic_vector(31 downto 0);
        SAXI_ARPROT	: in std_logic_vector(2 downto 0);
        SAXI_ARVALID	: in std_logic;
        SAXI_ARREADY	: out std_logic;
        SAXI_RDATA	: out std_logic_vector(32*(1+DATA_BUS_IS_64_BITS)-1 downto 0);
        SAXI_RRESP	: out std_logic_vector(1 downto 0);
        SAXI_RVALID	: out std_logic;
        SAXI_RREADY	: in std_logic
	);
	end component;

	signal sig_SAXI_ACLK	:  std_logic:='0';
	signal sig_SAXI_ARESETN	:  std_logic:='1';
	signal sig_SAXI_AWADDR	:  std_logic_vector(31 downto 0);
	signal sig_SAXI_AWPROT	:  std_logic_vector(2 downto 0);
    signal sig_SAXI_AWVALID	:  std_logic;
	signal sig_SAXI_AWREADY	:  std_logic;
	signal sig_SAXI_WDATA	:  std_logic_vector(32*(1+DATA_BUS_IS_64_BITS) -1 downto 0);
	signal sig_SAXI_WSTRB	:  std_logic_vector((4*(1+DATA_BUS_IS_64_BITS))-1 downto 0);
	signal sig_SAXI_WVALID	:  std_logic;
	signal sig_SAXI_WREADY	:  std_logic;
	signal sig_SAXI_BRESP	:  std_logic_vector(1 downto 0);
	signal sig_SAXI_BVALID	:  std_logic;
	signal sig_SAXI_BREADY	:  std_logic;
	signal sig_SAXI_ARADDR	:  std_logic_vector(31 downto 0);
	signal sig_SAXI_ARPROT	:  std_logic_vector(2 downto 0);
	signal sig_SAXI_ARVALID	:  std_logic;
	signal sig_SAXI_ARREADY	:  std_logic;
    signal sig_SAXI_RDATA	:  std_logic_vector(32*(1+DATA_BUS_IS_64_BITS)-1 downto 0);
	signal sig_SAXI_RRESP	:  std_logic_vector(1 downto 0);
	signal sig_SAXI_RVALID	:  std_logic;
	signal sig_SAXI_RREADY	:  std_logic;
type tb_stimulous is record
    arvalid: std_logic;
    rready: std_logic;
    araddr: integer;
    awaddr: integer;
    wdata: integer;
    awvalid: std_logic;
    wvalid: std_logic;
    bready: std_logic;
end record;
constant num_vectors: integer:= 30;
type tb_data_array is array( 0 to num_vectors-1) of tb_stimulous;
constant tb_data: tb_data_array :=
(
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'1','1','1'),
('0','0',0,1,16#11111111#,'1','1','1'),
('0','0',0,2,16#22222222#,'1','1','1'),
('0','0',0,3,16#33333333#,'1','1','1'),
('1','0',0,0,16#00000000#,'0','0','0'),
('1','1',1,0,16#00000000#,'0','0','0'),
('1','1',2,0,16#00000000#,'0','0','0'),
('1','1',3,0,16#00000000#,'0','0','0'),
('0','1',0,0,16#00000000#,'0','0','0'),
('1','0',3,0,16#00000000#,'0','0','0'),
('1','0',2,0,16#00000000#,'0','0','0'),
('1','0',1,0,16#00000000#,'0','0','0'),
('1','0',1,0,16#00000000#,'0','0','0'),
('1','1',1,0,16#00000000#,'0','0','0'),
('1','1',1,0,16#00000000#,'0','0','0'),
('0','1',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0'),
('0','0',0,0,16#00000000#,'0','0','0')

);
begin
-- Instantiation of Axi Bus Interface S00_AXI
axi4_lite_subordinate_interface_01 : axi4_lite_interface_v1_0
	generic map (
		DATA_BUS_IS_64_BITS	=> 0,
		ADDR_WIDTH	=> 2,
		USE_WRITE_STROBES => true
	)
	port map (
        SAXI_ACLK =>sig_SAXI_ACLK,
        SAXI_ARESETN =>sig_SAXI_ARESETN,
        SAXI_AWADDR	=>sig_SAXI_AWADDR,
        SAXI_AWPROT	=>sig_SAXI_AWPROT,
        SAXI_AWVALID	=>sig_SAXI_AWVALID,
        SAXI_AWREADY	=>sig_SAXI_AWREADY,
        SAXI_WDATA	=>sig_SAXI_WDATA,
        SAXI_WSTRB	=>sig_SAXI_WSTRB,
        SAXI_WVALID	=>sig_SAXI_WVALID,
        SAXI_WREADY	=>sig_SAXI_WREADY,
        SAXI_BRESP	=>sig_SAXI_BRESP,
        SAXI_BVALID	=>sig_SAXI_BVALID,
        SAXI_BREADY	=>sig_SAXI_BREADY,
        SAXI_ARADDR	=>sig_SAXI_ARADDR,
        SAXI_ARPROT	=>sig_SAXI_ARPROT,
        SAXI_ARVALID =>sig_SAXI_ARVALID,
        SAXI_ARREADY =>sig_SAXI_ARREADY,
        SAXI_RDATA =>sig_SAXI_RDATA,
        SAXI_RRESP =>sig_SAXI_RRESP,
        SAXI_RVALID	=>sig_SAXI_RVALID,
        SAXI_RREADY	=>sig_SAXI_RREADY
	);



process begin 
 wait for 5ns; sig_SAXI_ACLK <= not(sig_SAXI_ACLK); 
end process; 
process
variable i: integer;
begin
    
    --reset
    sig_SAXI_ARESETN <= '0';
    wait until rising_edge(sig_SAXI_ACLK);
    wait until rising_edge(sig_SAXI_ACLK);
    sig_SAXI_ARESETN <= '1';
    wait until rising_edge(sig_SAXI_ACLK);
    for k in 0 to num_vectors-1 loop
        sig_SAXI_WSTRB<="1010";
        sig_SAXI_ArVALID <= tb_data(k).arvalid;
        sig_SAXI_RREADY <= tb_data(k).rready;
        sig_SAXI_ARADDR<= std_logic_vector( to_unsigned(tb_data(k).araddr,30)) & "00";
        sig_SAXI_AWADDR<= std_logic_vector( to_unsigned(tb_data(k).awaddr,30)) & "00";
        sig_SAXI_AWVALID <= tb_data(k).awvalid;
        sig_SAXI_WDATA	<= std_logic_vector( to_unsigned(tb_data(k).wdata,32));
        sig_SAXI_WVALID	<= tb_data(k).wvalid;
        sig_SAXI_BREADY <= tb_data(k).bready;
        wait until rising_edge(sig_SAXI_ACLK);

    end loop;
    wait for 1ms;
    --



end process;

end arch_imp;
