function ab = pmultshort(a,b)  % Two numbers to be multiplied. Here, a 
ab = 0;                        % should only ever be 1, 2, or 3 (or in bin
for i = 1:2                    % 01, 10, or 11).
    if bitget(a, i)            % Determines value of ith bit of a. If 1, 
        bi = (2^(i-1))*b;      % shifts b by (i-1) bits, then
        ab = bitxor(ab, bi);   % adds this result to the current  
    end                        % total using xor type addition.
end                            % Does this for 1st and 2nd digits of a.
for i = 10:-1:9                % Counting of digits goes right to left.
    if bitget(ab, i)           % Determines value of ith bit o, f ab. If 1,
        modi = (2^(i-9))*283;  % shifts 100011011 by (i-9) bits then
        ab = bitxor(ab, modi); % adds this to total using xor
    end                        % n.b. equivalent to subtraction. Does this  
end                            % for 10th and then 9th digits (right to  
end                            % left)of ab if it has that many.