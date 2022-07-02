function PSNR = myPSNR(P1,P)
    [height,width] = size(P);
    deltaM = double(P1 - P);
    deltaV = reshape(deltaM,1,height*width);
    MSE = norm(deltaV).^2 /height/width;
    PSNR = 10 * log10(255.^2 / MSE);
end