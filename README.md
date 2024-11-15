# Simple Verilog Traffic Controller
## Introduction
Traffic light controllers are simple and beginner-friendly project themes to apply Verilog and gain a hands-on experience in _finite-state machines_ (FSMs). Applying this project in practice promotes the student from a basic level in Verilog to a more intermediate level.
## Objective
Suppose a T-intersection employs three traffic lights to manage vehicle movement. This project aims to direct traffic with a controller that caters to timing and bystander movement in addition to regular traffic.
## Requirements
Each traffic light will be green for a certain period of time:
+ Mode 0 -> 30s
+ Mode 1 -> 30s
+ Mode 2 -> 10s
+ Mode 3 -> 20s

Mode 0 is the state the system should transition to after a bystander clicks the crossing button. The rest each pertain to the three lights in order.
## Results & Conclusion
This traffic light module, despite its simplicity, is capable of maintaining a two-light traffic system of three parts for a variable property as can be seen in the _traffic_lights_controller_tb_ module. It is completely written and tested in Verilog HDL, quite the achievement for a 2nd year student!
