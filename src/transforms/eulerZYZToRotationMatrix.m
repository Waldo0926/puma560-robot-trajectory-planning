function R = eulerZYZToRotationMatrix(phiDeg, thetaDeg, psiDeg)
%EULERZYZTOROTATIONMATRIX Convert Z-Y-Z Euler angles to a rotation matrix.
%   R = eulerZYZToRotationMatrix(phiDeg, thetaDeg, psiDeg) returns
%
%       R = Rz(phiDeg) * Ry(thetaDeg) * Rz(psiDeg)
%
%   All input angles are in degrees.

    phi = deg2rad(phiDeg);
    theta = deg2rad(thetaDeg);
    psi = deg2rad(psiDeg);

    c1 = cos(phi); s1 = sin(phi);
    c2 = cos(theta); s2 = sin(theta);
    c3 = cos(psi); s3 = sin(psi);

    Rz1 = [c1, -s1, 0; s1, c1, 0; 0, 0, 1];
    Ry  = [c2, 0, s2; 0, 1, 0; -s2, 0, c2];
    Rz2 = [c3, -s3, 0; s3, c3, 0; 0, 0, 1];

    R = Rz1 * Ry * Rz2;
end
