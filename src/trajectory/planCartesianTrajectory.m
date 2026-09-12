function trajectory = planCartesianTrajectory(waypoints, maxSpeed, sampleTime, accelTime)
%PLANCARTESIANTRAJECTORY Interpolate Cartesian waypoints using mstraj.
%   Requires Peter Corke's Robotics Toolbox for MATLAB.

    arguments
        waypoints (:, 3) double
        maxSpeed (1, 3) double = [0.5, 0.5, 0.5]
        sampleTime (1, 1) double {mustBePositive} = 0.02
        accelTime (1, 1) double {mustBeNonnegative} = 0.2
    end

    if size(waypoints, 1) < 2
        error('planCartesianTrajectory:TooFewWaypoints', ...
            'At least two waypoints are required.');
    end

    requireRoboticsToolbox({'mstraj'});

    startPoint = waypoints(1, :);
    viaPoints = waypoints(2:end, :);
    trajectory = mstraj(viaPoints, maxSpeed, [], startPoint, sampleTime, accelTime);
end
