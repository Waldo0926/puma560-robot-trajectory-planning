%% Lightweight tests for toolbox-independent rotation utilities
projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(projectRoot);
setup_project();

fprintf('Running rotation utility tests...\n');

%% Z-Y-X round trip
zyx = [45, 30, -20];
R = eulerZYXToRotationMatrix(zyx(1), zyx(2), zyx(3));
assert(isRotationMatrix(R));
recovered = rotationMatrixToEuler(R);
assert(max(abs(recovered.ZYX.deg - zyx)) < 1e-9);

%% Identity
I = eulerZYXToRotationMatrix(0, 0, 0);
assert(norm(I - eye(3), 'fro') < 1e-12);

%% Z-Y-X gimbal-lock representatives must reconstruct the same matrix
for singularZYX = [10, 90, 25; 20, -90, 30]'
    inputZYX = singularZYX';
    Rsingular = eulerZYXToRotationMatrix(inputZYX(1), inputZYX(2), inputZYX(3));
    recoveredSingular = rotationMatrixToEuler(Rsingular);
    reconstructed = eulerZYXToRotationMatrix( ...
        recoveredSingular.ZYX.deg(1), recoveredSingular.ZYX.deg(2), recoveredSingular.ZYX.deg(3));
    assert(recoveredSingular.ZYX.singular);
    assert(norm(Rsingular - reconstructed, 'fro') < 1e-9);
end

%% Z-Y-Z round trip away from singularities
zyz = [30, 50, -20];
Rzyz = eulerZYZToRotationMatrix(zyz(1), zyz(2), zyz(3));
recoveredZYZ = rotationMatrixToEuler(Rzyz);
RzyzRecovered = eulerZYZToRotationMatrix( ...
    recoveredZYZ.ZYZ.deg(1), recoveredZYZ.ZYZ.deg(2), recoveredZYZ.ZYZ.deg(3));
assert(norm(Rzyz - RzyzRecovered, 'fro') < 1e-9);

%% Invalid matrix must be rejected
invalidRejected = false;
try
    rotationMatrixToEuler(ones(3));
catch ME
    invalidRejected = strcmp(ME.identifier, 'rotationMatrixToEuler:InvalidRotation');
end
assert(invalidRejected);

fprintf('All toolbox-independent tests passed.\n');
