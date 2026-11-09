%% Example Usage
clc;clear all; close all;
d2r=pi/180; r2d=180/pi;
dt=0.0025;
t=0:dt:10;
N=length(t);
%-----Angles-----
roll  = 0;%0.2*d2r;%
pitch =45*d2r ;
yaw   = 0.2*d2r;%0;%
%------Rates
p =2*d2r; %0;%
q=0;%2*d2r;%
r=0;%2*d2r;%
for i=1:N-1
    pitch_rate(i)=q*r2d;
    roll_rate(i)=p*r2d;
    yaw_rate(i)=r*r2d;
end
% 1. Convert Euler to Quaternion [w, x, y, z]
quaternion = euler2quat(roll, pitch, yaw);
% fprintf('Quaternion [w, x, y, z]: [%.4f, %.4f, %.4f, %.4f]\n', q);
for i= 1:(N-1)
    q_dot (:,i)= quat_rates(quaternion(:,i), p, q, r);
    quaternion(:,i+1)=quaternion(:,i)+q_dot(:,i)*dt;
    [r_out, p_out, y_out] = quat2euler(quaternion(:,i));
    roll_out(i) = r_out;
    theta_out(i) = p_out;
    yaw_out(i) =y_out;
end

% 2. Convert Quaternion back to Euler [roll, pitch, yaw]
% [r_out, p_out, y_out] = quat2euler(quaternion);
%% Plots
figure('Name','Angles');
subplot(3,1,1);
plot(t(2:end),roll_out,'b','LineWidth',2);
xlabel('Time (sec)')
ylabel('Roll-Angle(deg)')
title('Roll Angle Plot')
grid on;
subplot(3,1,2);
plot(t(2:end),theta_out,'r','LineWidth',2);
xlabel('Time (sec)')
ylabel('Pitch-Angle(deg)')
title('Pitch Angle Plot')
grid on;
subplot(3,1,3);
plot(t(2:end),yaw_out,'b','LineWidth',2);
xlabel('Time (sec)')
ylabel('Yaw-Angle(deg)')
title('YawAngle Plot')
grid on;
figure('Name','Rate-Plot')
subplot(3,1,1);
plot(t(2:end),roll_rate,'b','LineWidth',2);
xlabel('Time (sec)')
ylabel('Roll-Rate(deg/s)')
title('Roll Rate Plot')
grid on;
subplot(3,1,2);
plot(t(2:end),pitch_rate,'r','LineWidth',2);
xlabel('Time (sec)')
ylabel('Pitch-Rate(deg/s)')
title('Pitch Rate Plot')
grid on;
subplot(3,1,3);
plot(t(2:end),yaw_rate,'b','LineWidth',2);
xlabel('Time (sec)')
ylabel('Yaw-Rate(deg/s)')
title('Yaw Rate Plot')
grid on;


