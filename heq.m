function [feq, Heq] = heq(f, L)

% get histogram and size of original image
feq = f;
H2 = imhist(f,L)';
[X2,Y2] = size(f); N2 = X2*Y2;

prb = H2./N2; % make number of pixel to probability
transf = zeros(1,L); % transformation function matrix

for i=1:L
    temp_proba3 = 0.0; % initialization sum of probability to zero

    for j=1:i
    temp_proba3 = temp_proba3 + prb(j); % add probability 
    end

    temp = round(L*(temp_proba3)); % get pixel value that result of histogram equalization 

end

for x=1:X2
    for y=1:Y2
        feq(x,y) = transf(double(f(x, y))+1); % get changed pixel value and put into feq matix
    end
end

Heq = imhist(feq,L)'; % do imhist for feq