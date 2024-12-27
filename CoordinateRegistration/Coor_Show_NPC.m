clear
clc

 Coor=imread('C:\_0029.PNG');

Dicm=dicomread('C:\O\4.dcm');

Max=max(max(Dicm));
Dicm1=uint8(double(Dicm)/double(Max)*255);

Dicm3(:,:,1)=Dicm1;Dicm3(:,:,2)=Dicm1;Dicm3(:,:,3)=Dicm1;
for i=1:512
    for j=1:512
        if Coor(i,j)==1 
            for m=-1:1
                for n=-1:1
                    Dicm3(i+m,j+n,1)=255;Dicm3(i+m,j+n,2)=0;Dicm3(i+m,j+n,3)=0;
                end
            end
        end        
    end
end
imshow(Dicm3)

imwrite(Dicm3, 'Coor_NPC_10098822.tif','tif');


