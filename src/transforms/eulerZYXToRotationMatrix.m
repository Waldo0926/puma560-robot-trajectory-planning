function R = eulerZYXToRotationMatrix(zDeg, yDeg, xDeg)
%EULERZYXTOROTATIONMATRIX Convert intrinsic Z-Y-X Euler angles to a rotation matrix.
%   R = eulerZYXToRotationMatrix(zDeg, yDeg, xDeg) returns the 3-by-3
%   rotation matrix
%
%       R = Rz(zDeg) * Ry(yDeg) * Rx(xDeg)
%
%   All input angles are in degrees. Explicit axis-based names are used to
%   avoid the ambiguous alpha/beta/gamma convention found in the original
%   coursework implementation.

    z = deg2rad(zDeg);
    y = deg2rad(yDeg);
    x = deg2rad(xDeg);

    cz = cos(z); sz = sin(z);
    cy = cos(y); sy = sin(y);
    cx = cos(x); sx = sin(x);

    Rz = [cz, -sz, 0; sz, cz, 0; 0, 0, 1];
    Ry = [cy, 0, sy; 0, 1, 0; -sy, 0, cy];
    Rx = [1, 0, 0; 0, cx, -sx; 0, sx, cx];

    R = Rz * Ry * Rx;
end
