# GrFNNRhythm

This repository contains a user interface to explore GrFNN models for processing musical rhythms. The GUI (implemented in the file rhythmGUI) allows the user to choose a stimulus of a given rhythmic complexity (from a straightforward isochronous rhythm to more rhythmically complex syncopated rhythms) and process it through one of the following six GrFNN models:

1 - One GrFNN layer with no internal connections. This model can be used by selecting "One Layer" in the dropdown menu.

2 - One GrFNN layer with local (1:1) internal connections. Can be used by selecting "One Layer, local connection" in the dropdown menu.

3 - One GrFNN layer with 1:1, 2:1, 3:1, 1:2, and 1:3 internal connections. Can be used by selecting "One Layer, harmonic connections" in the dropdown menu.

4 - Two GrFNN layers with local (1:1) afferent connections, no internal connections. Can be used by selecting "Two Layer, afferent only".

5 - Two GrFNN layers with local (1:1) afferent, efferent, and internal connections. Can be used by selecting "Two Layer, all, local".

6 - Two GrFNN layers with 1:1, 2:1, 3:1, 1:2, and 1:3 afferent, efferent, and internal connections. Can be used by selecting "Two Layer, all, harmonic". 

The last model is meant to be more-or-less the same as the [Velasco & Large (2011)](http://ismir2011.ismir.net/papers/PS2-3.pdf) model from ISMIR. The most important difference is that the connections from Layer 2 (motor) to Layer 1 (sensory) are excitatory, not inhibitory. It is also nearly identical (with some simplifications) to the model from [Large, Herrera and Velasco (2015)](http://dx.doi.org/10.3389/fnsys.2015.00159).
