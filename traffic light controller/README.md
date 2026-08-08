# Traffic Light Controller Using Verilog

## 📌 Project Overview

This project implements a **Traffic Light Controller** using Verilog HDL.

The controller manages traffic signals for two roads:

* North-South (NS)
* East-West (EW)

The design is implemented using a **Finite State Machine (FSM)**.

The controller continuously cycles through the traffic light sequence to ensure that the two directions receive the green signal at different times.

## 🚦 Traffic Light Sequence

The controller follows this sequence:

```text id="c3w5v4"
NS GREEN
    ↓
NS YELLOW
    ↓
EW GREEN
    ↓
EW YELLOW
    ↓
NS GREEN
    ↓
Repeat
```

## 🔹 Traffic Signals

### North-South Road

* `ns_red`
* `ns_yellow`
* `ns_green`

### East-West Road

* `ew_red`
* `ew_yellow`
* `ew_green`

## 🔹 FSM States

| State       | North-South | East-West |
| ----------- | ----------- | --------- |
| `NS_GREEN`  | Green       | Red       |
| `NS_YELLOW` | Yellow      | Red       |
| `EW_GREEN`  | Red         | Green     |
| `EW_YELLOW` | Red         | Yellow    |

## 📂 Project Structure

```text id="5l2cvi"
traffic-light-controller-verilog/
│
├── README.md
├── src/
│   └── traffic_light_controller.v
├── testbench/
│   └── tb_traffic_light_controller.v
└── simulation/
    └── waveform.png
```

## 💻 Design Description

The traffic light controller is implemented using a finite state machine.

The four states are:

```text id="q44xqv"
NS_GREEN
NS_YELLOW
EW_GREEN
EW_YELLOW
```

The controller changes state on every rising edge of the clock.

### State Transition

```text id="k4gjlr"
+------------+
|  NS GREEN  |
+------------+
       |
       v
+------------+
| NS YELLOW  |
+------------+
       |
       v
+------------+
|  EW GREEN  |
+------------+
       |
       v
+------------+
| EW YELLOW  |
+------------+
       |
       +----------> NS GREEN
```

## 🧪 Testbench

The testbench verifies that the traffic controller correctly changes between all four states.

The testbench is located at:

```text id="o2kq2p"
testbench/tb_traffic_light_controller.v
```

It generates:

* Clock signal
* Reset signal
* Simulation waveform
* Console output

## ▶️ Simulation Using Icarus Verilog

Compile the Verilog design and testbench:

```bash id="i8tbyw"
iverilog -o traffic_sim src/traffic_light_controller.v testbench/tb_traffic_light_controller.v
```

Run the simulation:

```bash id="9q6f5a"
vvp traffic_sim
```

The simulation generates:

```text id="2k6q8d"
traffic_light.vcd
```

## 📊 View Waveform Using GTKWave

Open the VCD file:

```bash id="k7ux84"
gtkwave traffic_light.vcd
```

Add these signals:

```text id="j0mbj4"
clk
rst

ns_red
ns_yellow
ns_green

ew_red
ew_yellow
ew_green
```

Take a screenshot of the waveform and save it as:

```text id="1e8p6c"
simulation/waveform.png
```

## 📋 Expected Simulation

The expected sequence is:

```text id="74s2lq"
NS GREEN  → EW RED
NS YELLOW → EW RED
NS RED    → EW GREEN
NS RED    → EW YELLOW
```

Then the sequence repeats.

At no time should both roads have their green lights active simultaneously.

## 🎯 Applications

Traffic light controllers are used in:

* Road intersections
* Embedded control systems
* FPGA projects
* Digital control systems
* Intelligent transportation systems
* Automated traffic management

## 📚 Learning Outcomes

This project demonstrates:

* Finite State Machine design
* Sequential logic
* Combinational logic
* Verilog HDL
* State transitions
* Clock and reset handling
* Testbench development
* Digital simulation
* GTKWave waveform analysis
* GitHub project organization

## 🛠️ Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

## 👩‍💻 Author

**Honey Praveena**

## 📄 License

This project is created for educational and academic purposes.
