%2. Matlab Basics
clear all
close all
clc
x = 2;
y = x*3^x*exp(2);

%Simple way
v1 = [1 2 3 4];
v2 = [1; 2; 3; 4];

%Better way
v1 = 1:1:4; %or linspace(1,4,4)

v = linspace(0,12,121);

R = 4.7e3;

%This won't do what we want, even though in this case it works
i = v/R;

%This will do what we want, Element-wise division.
i = v./R;

v(89)
i(89)

plot(v,i);
title('Current Increase over Resistor with Incremental Voltage');
xlabel('Voltage (Volts)');
ylabel('Current (Amps)');
legend('v = i/R','Location','southeast');

%3. Conditional Statements 
x=10;
y=5;
u = x > y;
v = x < y;
w = x == y;
ww = x >= 2*y;

T = 1e-3;
Vm = 1;

%4. For Loops
%Part 1
t = linspace(0,T,1001);
vf = zeros(1,1001); %preallocate to save time
for n = 1:1001
    vf(n) = Vm - (Vm/T).*t(n);
end
figure(2);
plot(t,vf);
title('V = Vm - (Vm/T)*t');
xlabel('Voltage (Volts)');
ylabel('Current (Amps)');

%Part 2
t = linspace(-T,2*T,3001);
vf = zeros(1,3001); %preallocate to save time
for n = 1:3001
    if t(n) > 0 && t(n) < T 
        vf(n) = (Vm - (Vm/T).*t(n));
    else
        vf(n) = 0;
    end
end
figure(3);
plot(t,vf);
xlabel('Voltage (Volts)');
ylabel('Current (Amps)');

%Part 3
t = linspace(-T,2*T,3001);
vf = zeros(1,3001); %preallocate to save time
for n = 1:3001
    vf(n) = (Vm - (Vm/T).*mod(t(n),T));
end
figure(4);
plot(t,vf);
xlabel('Voltage (Volts)');
ylabel('Current (Amps)');