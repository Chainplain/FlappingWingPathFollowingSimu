function [p_LF, v_LF, current_init_flag, current_k]= CalcRef(x_c, y_c, z_c, last_init_flag, last_k, ...
                                                             speed, d_d, d_LF)
%% Load the path
P = [  0,  0,  0;...
      20, 20, 20;...
      0,  0,  0;...
     100, 0,  0];
points_num = size(P, 1);
%% Check if initial condition
p_c = [x_c, y_c, z_c];
if last_init_flag
    P_C = ones(points_num, 1) * p_c;
    Diff = P - P_C;
    Diff_square = Diff(:,1).^2 + Diff(:,2).^2 + Diff(:,3).^2;
    [~,current_k] = min(Diff_square);
else
    disp(['last_k:',num2str(last_k)]);
    current_k = last_k;
end

current_init_flag = false;
%% Computation 
p_k = P(current_k, :);
next_k = current_k + 1;
if next_k > points_num
   next_k = next_k - points_num;
end

p_k_plus_1 = P(next_k, :);

l = (p_c - p_k) * (p_k_plus_1 - p_k)' / norm( p_k_plus_1 - p_k )^2;
p_r = l * (p_k_plus_1 - p_k) + p_k;

lookforward_d = d_d * d_LF / ( norm( p_r - p_c) + d_d);


k_LF = current_k;
if k_LF > points_num
   k_LF = k_LF - points_num;
end
next_k_LF = k_LF + 1;
if next_k_LF > points_num
   next_k_LF = next_k_LF - points_num;
end

if norm( P(next_k_LF,:) - p_r) >= lookforward_d
    p_LF = p_r + lookforward_d * ( P(next_k_LF,:) - p_k) / norm(  P(next_k_LF,:) - p_k );
    v_LF = speed * ( P(next_k_LF,:) - p_k) / norm(  P(next_k_LF,:) - p_k );
else
    k_LF = k_LF + 1;
    if k_LF > points_num
       k_LF = k_LF - points_num;
    end
    next_k_LF = k_LF + 1;
    if next_k_LF > points_num
       next_k_LF = next_k_LF - points_num;
    end
    
    disp(['next_k_LF:',num2str(next_k_LF)]);
    
    lookforward_d = lookforward_d - norm( p_k_plus_1 - p_r);
    for i = 1 :  points_num
        if norm( P(next_k_LF, :) - P(k_LF, :)) >= lookforward_d
            break;
        else            
            lookforward_d = lookforward_d - norm( P(next_k_LF, :) - P(k_LF, :));
                k_LF = k_LF + 1;
                if k_LF > points_num
                   k_LF = k_LF - points_num;
                end
                next_k_LF = k_LF + 1;
                if next_k_LF > points_num
                   next_k_LF = next_k_LF - points_num;
                end         
        end
    end
    disp(['k_LF:',num2str(k_LF)]);
    p_LF = P(k_LF, :) + lookforward_d * (P(next_k_LF, :) - P(k_LF, :)) / norm( P(next_k_LF, :) - P(k_LF, :) );
    v_LF = speed * (P(next_k_LF, :) - P(k_LF, :)) / norm( P(next_k_LF, :) - P(k_LF, :) );
end
end