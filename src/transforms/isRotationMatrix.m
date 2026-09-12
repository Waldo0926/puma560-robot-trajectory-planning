function tf = isRotationMatrix(R, tolerance)
%ISROTATIONMATRIX Check whether R is a proper 3-D rotation matrix.

    if nargin < 2
        tolerance = 1e-9;
    end

    tf = isnumeric(R) && isequal(size(R), [3, 3]);
    if ~tf
        return;
    end

    orthogonalityError = norm(R' * R - eye(3), 'fro');
    determinantError = abs(det(R) - 1);
    tf = orthogonalityError <= tolerance && determinantError <= tolerance;
end
