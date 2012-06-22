function [ adjusted_t ] = adjust_targets( t )
adjusted_t = zeros(62, size(t, 1));

for i = 1:size(t, 1)
    adjusted_t(t(i), i) = 1;
end

end

