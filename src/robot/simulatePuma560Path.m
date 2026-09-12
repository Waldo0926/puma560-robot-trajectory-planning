function result = simulatePuma560Path(localTrajectory, drawScale, worldOffset, animate)
%SIMULATEPUMA560PATH Map a Cartesian path to PUMA 560 inverse kinematics.
%   RESULT = simulatePuma560Path(TRAJECTORY, SCALE, OFFSET, ANIMATE)
%   converts an N-by-3 local trajectory into a small reachable workspace,
%   solves analytical inverse kinematics with ikine6s, and optionally
%   animates the PUMA 560 model.
%
%   This function targets Peter Corke's Robotics Toolbox for MATLAB.

    arguments
        localTrajectory (:, 3) double
        drawScale (1, 1) double {mustBePositive} = 0.10
        worldOffset (1, 3) double = [0.40, 0.00, 0.00]
        animate (1, 1) logical = true
    end

    requireRoboticsToolbox({'mdl_puma560', 'transl', 'trotx'});

    % mdl_puma560 creates the SerialLink model variable p560 in the workspace.
    mdl_puma560;

    worldTrajectory = drawScale * localTrajectory + worldOffset;
    poses = transl(worldTrajectory);

    % Match the orientation used by the original coursework: point the tool
    % axis toward the drawing surface before solving IK.
    p560.tool = trotx(pi);
    jointTrajectory = p560.ikine6s(poses);

    if animate
        figure('Name', 'PUMA 560 Cartesian Path Simulation');
        p560.plot(jointTrajectory);
    end

    result.localTrajectory = localTrajectory;
    result.worldTrajectory = worldTrajectory;
    result.poses = poses;
    result.jointTrajectory = jointTrajectory;
    result.robot = p560;
end
