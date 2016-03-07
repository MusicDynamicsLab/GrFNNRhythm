# GrFNNRhythm

Entrainment of cortical rhythms to acoustic rhythms has been hypothesized to be the neural correlate of pulse and meter perception in music. A neurodynamic model by [Large, Herrera and Velasco (2015)](http://dx.doi.org/10.3389/fnsys.2015.00159) shows how self-organization of oscillations in interacting sensory and motor networks could be responsible for the formation of the pulse percept in complex rhythms. This model is one of the few consistent with neurophysiological evidence on the role of neural oscillation, and it explains a phenomenon (missing fundamental pulse) that other computational models fail to explain. This model provides a theoretical link between oscillatory neurodynamics and the induction of pulse and meter in musical rhythm.

The **GrFNNRhythm** repository contains MATLAB code that runs models of beat perception in musical rhythm using [**The GrFNN Toolbox**](https://github.com/MusicDynamicsLab/GrFNNToolbox). A user interface implemented in `rhythmUI.m` allows the user to choose a stimulus of a given rhythmic complexity (from a straightforward isochronous rhythm to more rhythmically complex, syncopated rhythms) and process it through one of the following six GrFNN models:

1. One network with no internal connections. This model can be used by selecting "One Layer" in the dropdown menu.

2. One network with local (1:1) internal connections. Can be used by selecting "One Layer, local connection" in the dropdown menu.

3. One network with 1:1, 2:1, 3:1, 1:2, and 1:3 internal connections. Can be used by selecting "One Layer, harmonic connections" in the dropdown menu.

4. Two networks with local (1:1) afferent connections, no internal connections. Can be used by selecting "Two Layer, afferent only".

5. Two networks with local (1:1) afferent, efferent, and internal connections. Can be used by selecting "Two Layer, all, local".

6. Two networks with 1:1, 2:1, 3:1, 1:2, and 1:3 afferent, efferent, and internal connections. Can be used by selecting "Two Layer, all, harmonic". 

The final model is nearly identical (with some simplifications) to the model from [Large, Herrera and Velasco (2015)](http://dx.doi.org/10.3389/fnsys.2015.00159). It is also more-or-less the same as the [Velasco & Large (2011)](http://ismir2011.ismir.net/papers/PS2-3.pdf) model from ISMIR. The most important difference is that the connections from Layer 2 (motor) to Layer 1 (sensory) are excitatory, not inhibitory.
