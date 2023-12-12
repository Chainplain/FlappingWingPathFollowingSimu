function angle_form_v1_2_v2 = angle_between(v1,v2)
% This function computes the radian angle between two vectors
% written by chainplain 2023-11-9
% - Please use [2x1] or [3x1] vectors for v1 and v2
% - please keep v1 and v2 the same dimension.
% ```
% >> angle_between([0;0;1],[0;1;1])
%    ans = 0.7854
% >> angle_between([0;1],[0;-1])
%    ans = 3.1416
% ```
if length(v1) == 2
    former_product = v1(1)*v2(2) - v1(2)*v2(1);
else
    former_product = cross(v1, v2);
end

dot_product = dot(v1, v2);
angle_form_v1_2_v2 = atan2(former_product, dot_product);
end
