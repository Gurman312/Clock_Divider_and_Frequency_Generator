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
Pro's of AMD Vivado:

- All-in-One Tool – Includes synthesis, simulation, place-and-route, verification, and debugging in a single environment.
- Supports High-End Xilinx FPGAs – Designed for modern Xilinx devices like Zynq, Versal, and UltraScale+.
- High-Performance Synthesis – Optimized for Xilinx FPGAs, often leading to better area, timing, and power efficiency.
- Incremental Compilation – Speeds up compilation by reusing previous results for minor design changes.
- Multi-Threading & Parallel Processing – Faster synthesis and implementation on multi-core CPUs.

## RTL Design
