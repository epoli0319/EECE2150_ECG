tbl = readtable('ecg1.csv');
A = table2array(tbl);

ECG_signal=A(:,3);
time=A(:,2);
no=60;
fs=1000;

% This script needs:
%       The signal voltage array named "ECG_signal"
%       The time in an array named "time"
%       Sampling rate (Hz) in a variable "fs"
%       Frequency to notch-out in Hz in a variable "no"
%
wo=no/(fs/2);                % Normalized center frequency of notch filter
bw=wo/20;                   % Q is chosen to be 20  
[b,a] = iirnotch(wo, bw);   % Obtain filter coefficients
fvtool(b, a);               % PLots the filter frequency response
ECG_signal_filtered = filter(b, a, ECG_signal);
figure(2)
subplot(2,1,1)
plot(time, ECG_signal);
title('Original Signal Time Domain')
xlabel('Time (s)');
subplot(2,1,2);
plot(time, ECG_signal_filtered);
title('Signal Filtered Using the Notch Filter Time Domain')
xlabel('Time (s)');
figure(3)
plot_frequency_content(ECG_signal,fs, 8000);
figure(4)
plot_frequency_content(ECG_signal_filtered,fs, 8000);
