# Clock_Divider_and_Frequency_Generator
## Introduction
<p align="justify">This project implements a Clock Divider and Frequency Generator using Verilog, simulated in Vivado. It takes an input clock and generates multiple lower-frequency clocks by dividing the input clock signal. Sequential circuits need a reliable clock signal to provide a stable time base for circuit operations.</p>
 
### Why Do We Need a Clock Divider?
<p allign="justify">Most digital systems need several (or even dozens of) different clock signals to drive different subsystems. For example, an FPGA-based system might use a 48KHz clock to produce an audio stream, a 1KHz clock to run a timer, a 10MHz clock to run a small processor, and a 12KHz clock to run a motor controller. It would be too expensive to use separate external oscillator circuits to create so many different clock signals, so systems typically produce the clocks they need from just one or two main clock inputs. If an input clock is 100 MHz and the division factor is 4, the output frequency will be 100 MHz / 4 = 25 MHz.</p>
<img src = "https://media.licdn.com/dms/image/v2/D5612AQHc9xaJgEvYwA/article-inline_image-shrink_1500_2232/article-inline_image-shrink_1500_2232/0/1701489781545?e=1744243200&v=beta&t=lUSHIzDP9tkzgGfAgjGaSXMJ6UmbIMXak-SXAZxMr1c" width="500" height="350">

## Tools Used
### AMD Vivado
<img src = "https://www.xilinx.com/content/xilinx/en/support/quality/quality-design/_jcr_content/root/responsivegridgraybottom/responsivegridgraybottomcolcontainer/parsyscol3/xilinxpromo_6023.img.jpg/1686867480903.jpg">
<p allign="justify">To create the RTL design and verify the design using testbench AMD Vivado is used. Various alternatives like Intel Quartus Prime, Mentor Questa (Modelsim), Cadence Xcelium can also be used.</p> 
<p allign="justify">Pro's of AMD Vivado:

- All-in-One Tool – Includes synthesis, simulation, place-and-route, verification, and debugging in a single environment.
- Supports High-End Xilinx FPGAs – Designed for modern Xilinx devices like Zynq, Versal, and UltraScale+.
- High-Performance Synthesis – Optimized for Xilinx FPGAs, often leading to better area, timing, and power efficiency.
- Incremental Compilation – Speeds up compilation by reusing previous results for minor design changes.
- Multi-Threading & Parallel Processing – Faster synthesis and implementation on multi-core CPUs.</p>

## RTL Design
<p allign="justify">The Register-Transfer Level (RTL) design describes the circuit at a high-level, defining how data flows between registers and how logic operations are performed. This section explains the architecture, components, and working principles of the Clock Frequency Generator implemented in Verilog.</p>

### RTL Block Diagram
The Clock Frequency Generator consists of the following key components:

- Clock Input (clk_in) – The main system clock.
- Reset (reset) – Resets all counters and outputs.
- Clock Dividers (clk_out_1, clk_out_2, clk_out_4) – Generates different frequency clocks.
- Counters (counter_1, counter_2, counter_3) – Used to divide the input clock.

Following is the RTL design obtained in Vivado

![RTL_Design](https://github.com/user-attachments/assets/b257b580-ef08-4631-a7d6-d5b5a655199a)

The clock divider reduces the frequency by using counters. When the counters reaches **DIV_FACTOR/2-1** , the clock output toggles. This results in an output clock with half the frequency of the input clock.

- Instead of hardcoding values, parameters are used to define clock division factors. This makes the design flexible.
- Registers **reg** store counter values. The counters increment on every clock cycle.
- If **reset = 1**, all counters are cleared, and outputs are set to 0.
- When counter reaches **DIV_FACTOR/2 - 1**, the clock toggles **~clk_out**. Else, counter increments every clock cycle.

## TestBench
After writing the RTL module, we need to verify the design. We will write a testbench to fulfill this purpose. The testbench connects the Clock Frequency Generator module and drives it with a test signal.

- **reg** - Signals that will be driven by testbench (inputs).
- **wire** - Signals driven by DUT (outputs).
- The DUT instance **uut** is created. Parameters **DIV_FACTOR_1, DIV_FACTOR_2, etc.** are set. Connections **.clk_in(clk_in), etc.** link testbench signals to DUT.
- Generate a 100MHz clock (10ns period). **always #5** - will toggle **clk_in** every 5ns (creates a clock signal).
- Simulation runs for 200 ns, then stops and gives the following output waveform which shows the original clock signal and the output clock signals as well.

![Output_Waveform](https://github.com/user-attachments/assets/c986f078-acdc-4389-8d75-ec6ff93cb49f)
We can observe the changing frequency of the output clocks according to the division parameter selected.
