%% Simulink Demonstration Script
% Provided by Hummels.
%
% This script (and the accompanying simulink model) illustrates how to run
% a simulink model from a script, capture the output, and make a variety of
% plots.

%% Simulation Parameters
% The simulink model is composed of a lowpass filter followed by a highpass
% filter to model a (crumby) bandpass response.  The filter parameters and
% the input pulse-width have been entered as "workspace variable".  I'm
% defining them here, but I'll run the simulation later in the script using
% a variety of values.
k = 10;
w = 2 * pi * 10^6;
e = .3;
pw = 1e-9;   % Rectangular input pulse width (seconds)
a = k*(w)^2;
b = 2*e*w;
c = w^2;

%% Simulation Model
% Doing the open_system() call here is not really needed for the
% script---but it does make the matlab "publish" include the simulation
% block diagram in its output.  (For me, I have to close the model before
% doing the publish command to force the inclusion of the diagram.)
open_system('ECE314HW5_2c');


%% First Bogus Plot
% Run the simulation, capture and plot the lowpass and bandpass outputs.
% The "StartTime", "StopTime", and "MaxStep" parameters are specified here,
% but are optional.  The parameters would otherwise default to the values
% set in the simulink "Configuration Parameters" dialog box.
simout = sim('ECE314HW5_2c',...
             'StartTime', '-1e-7',...
             'StopTime', '1e-5',...
             'MaxStep', '0.01e-9');
yout = get(simout,'yout');  % Get the input time-series structure
t = yout.Time;
x = yout.Data;
t2 = linspace(0, 10e-6, 51);
h = 

figure(1); clf;
plot(t,x);
hold on;
stem(h);
xlabel('Time (msec)');
ylabel('Voltage');
title('Bandpass Output, 2 msec pulse at t=1 msec');
grid on;