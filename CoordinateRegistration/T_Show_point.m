function  T_Show_point( Im3D1,point )

[Tx,Ty,Tz]=size(Im3D1);
flag(1:Tz)=0;
Im3D=uint8(Im3D1);
for t=1:Tz
    Max=max(max(Im3D1(:,:,t)));
    Imgtt=Im3D1(:,:,t);
    Im3D(:,:,t)=uint8(double(Imgtt)/double(Max)*255.0);
end


SIm3D(:,:,:,1)=Im3D;
SIm3D(:,:,:,2)=Im3D;
SIm3D(:,:,:,3)=Im3D;

Num=size(point,1);
for z=1:Num
    flag(point(z,3))=1;
    x=point(z,1);y=point(z,2);
    for i=x-5:x+5
        for j=y-5:y+5
            SIm3D(i,j,point(z,3),1)=255;
            SIm3D(i,j,point(z,3),2)=255;
            SIm3D(i,j,point(z,3),3)=0;
        end
    end
end

num=0;
 for t=1:Tz
     if flag(t)==1
         num=num+1;
%          subplot(2,2,num)
         img(:,:,1)=SIm3D(:,:,t,1);
         img(:,:,2)=SIm3D(:,:,t,2);
         img(:,:,3)=SIm3D(:,:,t,3);
         imshow(img);
     end
 end


end

