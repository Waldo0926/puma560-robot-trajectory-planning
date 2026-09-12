function angles = rotationMatrixToEuler(R, tolerance)
%ROTATIONMATRIXTOEULER Recover Z-Y-X and Z-Y-Z Euler-angle solutions.
%   angles = rotationMatrixToEuler(R) validates R and returns a structure:
%       angles.ZYX.deg      -> [z, y, x] in degrees
%       angles.ZYX.singular -> true near gimbal lock
%       angles.ZYZ.deg      -> [phi, theta, psi] in degrees
%       angles.ZYZ.singular -> true when theta is near 0 or pi
%
%   Euler-angle decompositions are not unique. At singular configurations,
%   one angle is set to zero to return a deterministic representative.

    if nargin < 2
        tolerance = 1e-9;
    end

    if ~isRotationMatrix(R, 1e-7)
        error('rotationMatrixToEuler:InvalidRotation', ...
            'Input must be a 3-by-3 proper rotation matrix.');
    end

    %% Z-Y-X: R = Rz(z) * Ry(y) * Rx(x)
    sy = -R(3, 1);
    sy = max(-1, min(1, sy));
    y = asin(sy);
    cy = cos(y);

    if abs(cy) > tolerance
        x = atan2(R(3, 2), R(3, 3));
        z = atan2(R(2, 1), R(1, 1));
        zyxSingular = false;
    else
        % Gimbal lock: x and z are coupled. Choose x = 0.
        x = 0;
        z = atan2(-R(1, 2), R(2, 2));
        zyxSingular = true;
    end

    %% Z-Y-Z: R = Rz(phi) * Ry(theta) * Rz(psi)
    theta = atan2(hypot(R(1, 3), R(2, 3)), R(3, 3));
    sTheta = sin(theta);

    if abs(sTheta) > tolerance
        phi = atan2(R(2, 3), R(1, 3));
        psi = atan2(R(3, 2), -R(3, 1));
        zyzSingular = false;
    else
        % Only a combination of phi and psi is observable. Choose psi = 0.
        psi = 0;
        if R(3, 3) > 0
            phi = atan2(R(2, 1), R(1, 1));
        else
            phi = atan2(-R(2, 1), -R(1, 1));
        end
        zyzSingular = true;
    end

    angles.ZYX.deg = rad2deg([z, y, x]);
    angles.ZYX.singular = zyxSingular;
    angles.ZYZ.deg = rad2deg([phi, theta, psi]);
    angles.ZYZ.singular = zyzSingular;
end
