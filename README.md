# GrFNNRhythm

Repository for rhythm model.

This repository contains six different rhythm models, implemented in the following scripts:

rhythm1 – one layer, no internal connections

rhythm1c1 – one layer, local (1:1) internal connections

rhythm1c3 – one layer, internal connections, 1:1, 2:1, 3:1, 1:2, 1:3

rhythm2 – two layer2, local (1:1) afferent connections, no internal connections

rhythm2c1 – two layer2, local (1:1) afferent, internal and efferent connections

rhythm2c3 – two layer2, 1:1, 2:1, 3:1, 1:2, 1:3 afferent, internal and efferent connections

The script rhythm2c3 is meant to be more-or-less the same as the Velasco & Large 2011 model from ISMIR. The most important difference is that the connections from Layer 2 (motor) to Layer 1 (sensory) are excitatory, not inhibitory. It is also nearly identical (with some simplifications) to the Large & Velasco model from the Herrera, Velasco & Large paper. The script experimentRhythms.m runs one time through each of the rhythms from the Velasco & Large experiment, and produces the figures from the Herrera, Velasco & Large paper. You can change the variable makeModel to point to any one of the six model scripts.

These models still need parameters tweaked, including relative strength of the 2:1, 3:1, 1:2, 1:3 resonances.
