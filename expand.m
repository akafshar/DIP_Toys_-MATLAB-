% Function to expand an input image
% Takes as input a (RGB) color image X and a scale factor n
% Returns input image scaled n times

% Written by Amir K. Afshar

function[img] = expand(X,n)

rows = length(X(:,1,1));            % Number of rows of input image
columns = length(X(1,:,1));         % Number of columns of input image

X = rgb2hsv(X); % Convert input image from RGB to HSV
    
M1 = zeros(n*rows,columns);         % Initialize first expansion matrix
M2 = zeros(n*rows,n*columns);       % Initialize second expansion matrix
img = zeros(n*rows,n*columns,3);    % Initialize (final)
                                    % 3-channel expansion HSV matrix
    

for t = 1:3                 % Index for each of 3 channels (H, S, V)

    k = 0;
    m = 0;

    for i = 1:rows              % Copy rows n times (First expanded matrix)

        for j = (1+k*n):n*rows
            M1(j,:) = X(i,:,t);
        end

        k = k+1;

    end

    for i = 1:columns           % Copy columns (of n*rows) n times (Second expanded matrix)

        for j = (1+m*n):n*columns
            M2(:,j) = M1(:,i);
        end

        m = m+1;

    end
    
    img(:,:,t) = M2;            % Store second expanded matrix for each channel

end

img = hsv2rgb(img);             % Convert back to RGB
%img = uint8(round(img*255));    % Convert back to unsigned integers





