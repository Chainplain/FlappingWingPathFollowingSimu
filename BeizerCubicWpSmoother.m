function ControlPoints = BeizerCubicWpSmoother(wp1,wp2,wp3,max_cur)
% This function return the smooth Beizer curve control points ias [B0 B1 B2 B3(E3) E2 E1 E0]
% --written by chainplain 2023-11-9
% wp1: waypoint1 [2x1] or [3x1] vector
% wp2: waypoint2 [2x1] or [3x1] vector
% wp3: waypoint3 [2x1] or [3x1] vector
% max_cur: max curvature
% 

Extremm_small_constant = 1e-10;

c1 = 7.2364;
c2 = 0.4 * ( sqrt(6) - 1);
c3 = (c2 + 4) / (c1 + 6);
w1_2_w2 = wp2 - wp1;
w2_2_w3 = wp3 - wp2;

gamma = angle_between(w1_2_w2, w2_2_w3);
if gamma < 0
    gamma = 2 * pi + gamma;
end
beta = gamma / 2;

d = (c2 + 4)^2 / (54 * c3) * sin(beta) / (max_cur * cos(beta)^2);

h = c3 * d;
g = c2 * c3 * d;
k = 6 * c3 * cos(beta) / (c2 + 4) * d;

u1 = - w1_2_w2 ./ (norm(w1_2_w2) + Extremm_small_constant);
u2 = w2_2_w3 ./ (norm(w2_2_w3) + Extremm_small_constant);

B0 = wp2 + d * u1;
B1 = B0 - g * u1;
B2 = B1 - h * u1;

E0 = wp2 + d * u2;
E1 = E0 - g * u2;
E2 = E1 - h * u2;

B3 = (B2 + E2) ./ 2;
% E3 = B3

ControlPoints = [B0; B1; B2; B3; E2; E1; E0];
end

