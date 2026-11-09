%% Function: Compute Quaternion Rates from Body Rates (p, q, r)
function q_dot = quat_rates(quaternion, p, q, r)
    % Ensure column vector for matrix multiplication
    quaternion = quaternion(:);

    % Skew-symmetric Omega matrix for body-frame angular rates [p, q_rate, r]
    Omega = [  0,      -p,      -q, -r;
               p,       0,       r,      -q;
               q, -r,       0,       p;
               r,       q, -p,       0 ];

    % Calculate quaternion derivative
    q_dot = 0.5 * Omega * quaternion;

    % Match input orientation (row vs column)
    if isrow(quaternion)
        q_dot = q_dot';
    end
end