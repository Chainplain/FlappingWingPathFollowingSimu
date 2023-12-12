TestLength = (5 : 5 : 100)';
p_LF = zeros(size(TestLength, 1),3);
v_LF = zeros(size(TestLength, 1),3);

for i = 1:size(TestLength, 1)
    [p_LF(i,:), v_LF(i,:), current_init_flag, current_k] = CalcRef(16, 16, 16, true, 1, 1, 1, TestLength(i));
end

p_LF
v_LF

% CalcRef(x_c, y_c, z_c, last_init_flag, last_k, speed, d_d, d_LF)