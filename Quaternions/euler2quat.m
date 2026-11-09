%% Function 1: Euler Angles (ZYX) to Quaternion [w, x, y, z]
function q = euler2quat(roll, pitch, yaw)
    % Compute half-angle cosines and sines
    cr = cos(roll / 2);
    sr = sin(roll / 2);
    cp = cos(pitch / 2);
    sp = sin(pitch / 2);
    cy = cos(yaw / 2);
    sy = sin(yaw / 2);

    % Calculate quaternion components
    w = cy * cp * cr + sy * sp * sr;
    x = cy * cp * sr - sy * sp * cr;
    y = sy * cp * sr + cy * sp * cr;
    z = sy * cp * cr - cy * sp * sr;

    q = [w; x; y; z];
end

