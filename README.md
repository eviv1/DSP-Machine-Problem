# DSP-Machine-Problem
## Application 1: Transmission Lines
In communication systems, transmission media are necessary to carry signals from one location to another. Transmission media can be guided or unguided. We will simulate a guided transmission line using a coaxial cable in this item. A good transmission line (uniform characteristic impedance) must be able to transmit all the power from the transmitting end to the receiving end. However, if the transmission line is damaged, some power gets reflected, which is undesired.

Suppose that the transmission line is represented by the function file `[y] = transline(x)`, where `x` is the input signal, and `y` is the output signal. You are tasked to design an input signal to probe the transmission line and approximate the magnitude response by system identification. Moreover, the transmission line defined by the function file is corrupted with noise.

You may design an input sequence by using the following:
- Impulse
- Rectangular
- Hamming
- Hanning
- Kaiser
- Blackman-Harris

This can be accomplished by setting the pulse duration (Note: this parameter can be varied to observe trends, e.g., duration = 10 and 100) and padding zeros to match the sequence length. Plot the following whenever necessary for observation and analysis:
- Input sequence (time and frequency domain)
- Output sequence (time and frequency domain)
- Approximation of the magnitude response of the transmission line

## 2. Application 2: Filter Design
Design an 8th-order filter that will approximate a magnitude response as shown using a pole-zero placement approach (trial and error). You may check your work with the given `H.mat`, which contains the magnitude response of the system. Present the pole-zero plot, magnitude response, and phase of your design. Suppose that an input signal below is passed through your designed system, show the output plot (both in time domain and frequency domain).

## 3. Application 3: Digital Oscillator Design

Design a digital oscillator that will produce the signal `x(n)` from the previous item when excited with an impulse signal with a sampling frequency of 100 kHz. Draw the implementation, show your computation, and simulate and verify the system in MATLAB®. 

**Hint:** The system can be represented as parallel components.

## Application 4: Discrete Fourier Transform in Telephony

Push-button telephones use a combination of two sine tones to signal which button is currently being pressed:

### (a)
You receive a digital telephone signal with a sampling frequency of 8 kHz. You cut a 256-sample window out of this sequence, multiply it with a windowing function, and apply a 256-point DFT. What are the indices where the resulting vector (`X0, X1, ..., X255`) will show the highest amplitude if button 9 was pushed at the time of the recording? Show your manual calculations and MATLAB® code.

### (b)
Write a MATLAB® code to determine which button sequence was typed in the touch tones recorded in the file `touchtone.wav`.

## 5. Application 5: Deconvolution in Image Processing

Use MATLAB to deconvolve the blurred stars image files attached. The files `stars_blurred.png` with the blurred-stars image and `stars-psf.png` with the impulse response (point-spread function). Try different ways to control the noise and distortions near the margins (windowing).

