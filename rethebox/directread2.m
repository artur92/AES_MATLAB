% Inputs: A = 4x4 matrix of decimal representations of 8 bit bytes.
% Outputs: B = 4x4x2 matrix. B(:,:,1) contains the first digits of the hex
% representations of the same bytes from A. B(:,:,2) contains the second
% digits. N.B. The hex digits are themselves decimal numbers, that are not
% necessarily a single digit, e.g. e is represented by 14.
% This function transforms a 4x4 matrix of (decimal) numbers into a
% 4x4x2 array which can be used for reading into the s_box array.
function  D = directread2(A)
for i = 1:4
    
        % Creates array of first hex digits
        B(i,1) = (A(i,1) - mod(A(i,1),16))/16;
        % Creates array of second hex digits
        B(i,2) = mod(A(i,1),16);
        D(i,1) =  s_box(B(i,1)+1,B(i,2)+1);
 
end %for 1
end %function