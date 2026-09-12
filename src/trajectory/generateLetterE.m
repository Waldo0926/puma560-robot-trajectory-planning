function path = generateLetterE(scale)
%GENERATELETTERE Generate a continuous planar polyline for the letter E.
%   PATH = generateLetterE(SCALE) returns N-by-3 Cartesian waypoints in a
%   local drawing frame. The path deliberately retraces the vertical spine
%   to keep the drawing continuous without modelling pen-up/pen-down state.

    if nargin < 1
        scale = 1;
    end

    % Draw from upper-left: top bar -> spine -> bottom bar -> spine -> middle.
    path = [ ...
        1.00, 1.00, 0.00;
        0.00, 1.00, 0.00;
        0.00, 0.00, 0.00;
        1.00, 0.00, 0.00;
        0.00, 0.00, 0.00;
        0.00, 0.50, 0.00;
        0.75, 0.50, 0.00 ...
    ];

    path = scale * path;
end
