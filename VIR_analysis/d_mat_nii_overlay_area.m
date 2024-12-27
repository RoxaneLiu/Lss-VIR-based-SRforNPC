

clear, close, clc;
tic

Files1 = dir('C:\path\*.nii.gz'); % nii图像

path2 = 'C:\path\';
Files2 = dir(strcat(path2,'*.mat')); % 

mm = 777; % mat
nn = 32; % nii

a = zeros(512,512,36,nn); 
for n = 1:nn
    a(:,:,:,n) = imrotate(flip(convert_nii(Files1(n)),2),90);   
end

b = zeros(mm ,nn);
for i = 1:mm % mat
    i
    for m = 1:nn

        if  max(max(max(a(:,:,:,m) + convert_mat(Files2(i))))) == 2
            g = sum_image(floor((a(:,:,:,m) + convert_mat(Files2(i)))/2)); 
            b(i,m) = g; 
        end
    end
end

% save excle
xlswrite("out.xlsx",b,"sheet1","C3"); 

toc