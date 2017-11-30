function F = real2complex2(Y)
%F = real2complex2(Y)
%
%Returns the complex-valued vector F in the convention of the output of the
%fft, given the real-valued vectors containing phases and amplitudes in the
%structure Y.  This is the inverse function of 'complex2real'
%
%Inputs:    Structure Y with fields:
%   dc       mean value of y
%   amp      vector of amplitudes (length ceil(length(t)/2))
%   ph       vector of phases (in degrees, cosine phase)
%   n       length of t (needed for myifft)

%Outputs:
%   Y        complex-valued vector in the convention of the output of fft
%   t        time vector of size y (default is 1:length(y));
%
%SEE ALSO    complex2real2 fft2 ifft2

%4/15/09     Written by G.M. Boynton at the University of Washington


%'amp' and 'ph' have dc in center
F = zeros(Y.nPix,Y.nPix);

amp = Y.nPix^2*Y.amp/2;
ph = -pi*Y.ph/180;


F = amp.*exp(sqrt(-1)*ph);

F = ifftshift(F);
F(1) = Y.dc*Y.nPix^2;

%F has dc in corner
