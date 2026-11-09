%% Function 2: Quaternion [w, x, y, z] to Euler Angles (ZYX)
function [roll, pitch, yaw] = quat2euler(q)
r2d=180/pi;
    % Normalize quaternion to ensure unit length
    q = q / norm(q);
    w = q(1);
    x = q(2);
    y = q(3);
    z = q(4);

    % Roll (X-axis rotation)
    sinr_cosp = 2 * (w * x + y * z);
    cosr_cosp = 1 - 2 * (x^2 + y^2);
    roll_rad = atan2(sinr_cosp, cosr_cosp);
    roll = roll_rad*r2d;

    % Pitch (Y-axis rotation) with gimbal lock clamping
    sinp = 2 * (w * y - z * x);
    sinp = max(-1.0, min(1.0, sinp)); % Clamp to [-1, 1]
    pitch_rad = asin(sinp);
    pitch = pitch_rad*r2d;

    % Yaw (Z-axis rotation)
    siny_cosp = 2 * (w * z + x * y);
    cosy_cosp = 1 - 2 * (y^2 + z^2);
    yaw_rad = atan2(siny_cosp, cosy_cosp);
    yaw =yaw_rad*r2d;
end