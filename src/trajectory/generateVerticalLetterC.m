function path = generateVerticalLetterC(radius, pointCount)
%GENERATEVERTICALLETTERC Generate a C-shaped path in the Y-Z plane.

    if nargin < 1
        radius = 1;
    end
    if nargin < 2
        pointCount = 80;
    end

    validateattributes(pointCount, {'numeric'}, {'scalar', 'integer', '>=', 3});
    theta = linspace(pi / 4, 7 * pi / 4, pointCount)';
    path = radius * [zeros(pointCount, 1), sin(theta), cos(theta)];
end
