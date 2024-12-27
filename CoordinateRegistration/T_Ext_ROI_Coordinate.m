function [ CoorPoint ] = T_Ext_ROI_Coordinate( Roi )
%攻取三维Roi数据中的ROI信息。
%输入参数Roi为三维数据
%输出参数RoiPoint为各个Roi的中心坐标点（质心点）。

RoiNum=0;
[Tx,Ty,Tz]=size(Roi);

for lay=Tz:-1:1 %scan
    for x=1:Tx
        for y=1:Ty
            if Roi(x,y,lay)==1%
                [Point, Num,Zx,Zy] = SeedFill( Roi(:,:,lay),x,y );
                for i=1:Num
                    Roi(Point(i,1),Point(i,2),lay)=0;
                end
                if Num>=10%。
                    RoiNum=RoiNum+1;
                    RPoint(RoiNum,3)=uint16(lay);
                    RPoint(RoiNum,1)=uint16(Zx);
                    RPoint(RoiNum,2)=uint16(Zy);
                end
            end
        end
    end
  
end
RPoint

[CoorPoint]=Sort_Point(RPoint(1:7,:),3);


end

function [pointOut]=Sort_Point(pointIn,n)
pointOut=pointIn;
num=size(pointIn,1);
for i=1:num-1
    %
    [Min,j]=max(pointOut(i:num,n));
    if j~=1
        point=pointOut(i,:);
        pointOut(i,:)=pointOut(j+i-1,:);
        pointOut(j+i-1,:)=point;    
    end
    
end
end

function [Point,Num,Zx,Zy] = SeedFill( ImIn,seedx,seedy )

[Hx,Wy]=size(ImIn);

MAX=1000000;
seqx=zeros(MAX,1);seqy=zeros(MAX,1);
i=1; j=MAX;
Sx=0;Sy=0;

FillIm=zeros(Hx,Wy)+1;

FillIm(seedx,seedy)=0;
ImIn(seedx,seedy)=0;
seqx(i)=seedx; seqy(i)=seedy;
Num=1;
Point(Num,1)=seedx;
Point(Num,2)=seedy;
while i ~=j

    j=mod(j,MAX)+1;
    Num=Num+1;
    Point(Num,1)=seqx(j);
    Point(Num,2)=seqy(j);
    Sx=Sx+Point(Num,1);
    Sy=Sy+Point(Num,2);
    if ImIn(seqx(j)+1,seqy(j))==1
        i=mod(i,MAX)+1;
        seqx(i)=seqx(j)+1;
        seqy(i)=seqy(j);
       
        ImIn(seqx(j)+1,seqy(j))=0;
        FillIm(seqx(j)+1,seqy(j))=0;
        
    end
    if ImIn(seqx(j)-1,seqy(j))==1
        i=mod(i,MAX)+1;
        seqx(i)=seqx(j)-1;
        seqy(i)=seqy(j);
       
        ImIn(seqx(j)-1,seqy(j))=0;
        FillIm(seqx(j)-1,seqy(j))=0;
       
    end
    if  ImIn(seqx(j),seqy(j)+1)==1
        i=mod(i,MAX)+1;
        seqx(i)=seqx(j);
        seqy(i)=seqy(j)+1;

        ImIn(seqx(j),seqy(j)+1)=0;
        FillIm(seqx(j),seqy(j)+1)=0;
      
    end
    if  ImIn(seqx(j),seqy(j)-1)==1
        i=mod(i,MAX)+1;
        seqx(i)=seqx(j);
        seqy(i)=seqy(j)-1;

        ImIn(seqx(j),seqy(j)-1)=0;
        FillIm(seqx(j),seqy(j)-1)=0;
      
    end
end
Zx=Sx/Num;
Zy=Sy/Num;
end