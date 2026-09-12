function setup_project()
%SETUP_PROJECT Add project source folders to the MATLAB path.

    projectRoot = fileparts(mfilename('fullpath'));
    addpath(genpath(fullfile(projectRoot, 'src')));
end
