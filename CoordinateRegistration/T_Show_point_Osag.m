function  T_Show_point_Osag( Img,point )

% [Tx,Ty]=size(Img);
PointNum=size(point,1);

ImgRgb(:,:,1)=Img;ImgRgb(:,:,2)=Img;ImgRgb(:,:,3)=Img;

for Num=1:PointNum
    x=point(Num,1);y=point(Num,2);
    for i=x-5:x+5
        for j=y-5:y+5
            ImgRgb(i,j,1)=255;
            ImgRgb(i,j,2)=255;
            ImgRgb(i,j,3)=0;
        end
    end     
end
imshow(ImgRgb);

end

