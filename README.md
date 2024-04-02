# Introduction

Data and codes for the work "Snail-inspired robotic swarms: a hybrid connector drives collective adaptation in unstructured outdoor environments"

# Content

## Matlab codes for robot geometry paramteric optimization.

### Prerequisites
Before proceeding, make sure you have the following:

1. MATLAB installed on your system.
2. The files paralI.m, II_opt.m, obj.m, and Noncon.m available on your machine.

### Getting Started
To optimize the geometry parameters of the snail robot, follow these steps:

1. Open MATLAB on your system.
2. Navigate to the directory where you have saved the paralI.m, II_opt.m, obj.m, and Noncon.m files.

### File Descriptions
The optimization process involves four main files:

#### paralI.m
This file contains the definition of the geometry parameters for the snail robot. You will need to modify this file to specify the initial values and bounds for the geometry parameters.

#### II_opt.m
This file serves as the main optimization script. It calls the fmincon function and sets up the optimization problem using the provided objective function and parameter bounds. You may need to modify this file to adjust the optimization settings or add additional constraints.

#### obj.m
This file defines the objective function that needs to be minimized during the optimization process. You will need to modify this file to calculate the objective function based on the snail robot's geometry parameters.

### Noncon.m
This file defines the constraint functions that need to be satisfied during the optimization process. You will need to modify this file to define the constraints based on the snail robot's geometry parameters.

### Running the Optimization
To run the optimization and find the optimal geometry parameters for the snail robot, follow these steps:

1. Open the II_opt.m file in MATLAB's editor.
2. Review the code and make any necessary modifications to the optimization settings, such as the maximum number of iterations or the tolerance for convergence.
3. Save any changes you made to the II_opt.m file.
4. In the MATLAB command window, type run II_opt.m and press Enter.
5. MATLAB will start the optimization process and display the progress and results in the command window.
6. Once the optimization is complete, MATLAB will output the optimal geometry parameters for the snail robot.


## Python codes for drawing three risk ratio when snail robot connects to another robot.

# TODO

Upload more documents about the snail robot research, such as its CAD files.
