
clear, close, clc;
tic

Files1 = dir('*.nii.gz'); % nii图像
b = load('excel.mat').b;

a = zeros(1,32);

for n = 1:32   
    a(:,n) = sum_image(convert_nii(Files1(n)));
    b(:,n) = 100 * b(:,n)/sum_image(convert_nii(Files1(n)));
end

d = num2cell(b);

[r,c] = size(d);    
for i = 1:r         
    for k = 1:c
        if d{i,k} ~= 0
            d{i,k} = strcat(num2str(d{i,k}),'%');
        end
    end
end

xlswrite("out1.xlsx",a,"sheet2","C2"); 
xlswrite("out2.xlsx",d,"sheet2","C3"); 

toc