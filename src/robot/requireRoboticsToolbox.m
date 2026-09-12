function requireRoboticsToolbox(requiredFunctions)
%REQUIREROBOTICSTOOLBOX Fail early when Peter Corke toolbox functions are missing.

    if nargin < 1
        requiredFunctions = {'mdl_puma560', 'mstraj', 'transl', 'trotx'};
    end

    missing = {};
    for i = 1:numel(requiredFunctions)
        if exist(requiredFunctions{i}, 'file') == 0
            missing{end + 1} = requiredFunctions{i}; %#ok<AGROW>
        end
    end

    if ~isempty(missing)
        error('requireRoboticsToolbox:MissingDependency', ...
            ['Peter Corke Robotics Toolbox functions are missing: %s. ', ...
             'Install the toolbox and run its startup script before this demo.'], ...
            strjoin(missing, ', '));
    end
end
