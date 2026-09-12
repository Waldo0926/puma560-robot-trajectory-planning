function path = generateLetterC(radius, pointCount)
%GENERATELETTERC Generate a planar C-shaped path in the X-Y plane.

    if nargin < 1
        radius = 1;
    end
    if nargin < 2
        pointCount = 80;
    end

    validateattributes(pointCount, {'numeric'}, {'scalar', 'integer', '>=', 3});
    theta = linspace(pi / 4, 7 * pi / 4, pointCount)';
    path = radius * [cos(theta), sin(theta), zeros(pointCount, 1)];
end
