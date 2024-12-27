function [D3]=T_TriShow_View_Osag(ROI,CoorPoint,Dcm,Info)

D3=0;


hold on
[Tx,Ty,Tz]=size(ROI);

%显示ROI
D1 = squeeze(ROI);
[x y z D1] = reducevolume(D1, [4 4 1]);
p1 = patch(isosurface(x,y,z,D1, 5,'verbose'), ...
'FaceColor', 'blue', 'EdgeColor', 'none'); %
p12 = patch(isocaps(x,y,z,D1, 5), 'FaceColor', 'interp', 'EdgeColor','none');
view(3);

%显示坐标
[D2]=Coordinate(CoorPoint,Tx,Ty,Tz);
[x y z D2] = reducevolume(D2, [4 4 1]);
p2 = patch(isosurface(x,y,z,D2, 5,'verbose'), ...
'FaceColor', 'red', 'EdgeColor', 'none'); %
p22 = patch(isocaps(x,y,z,D2, 5), 'FaceColor', 'interp', 'EdgeColor','none');
view(3);


%显示Dicom数据
[ Dcm,D0 ] = T_DeBackGroud( Dcm,Info);
[D3]=Modify(D0,CoorPoint);%


[x y z D3] = reducevolume(D3, [4 4 1]);
p3 = patch(isosurface(x,y,z,D3, 5,'verbose'), ...
'FaceColor', 'none', 'EdgeColor', 'none'); %
isonormals(x,y,z,D3,p3);
p32 = patch(isocaps(x,y,z,D3, 5), 'FaceColor', 'interp', 'EdgeColor','none');
view(3);

grid on
camlight('right'); lighting gouraud
colormap(gray(256));


hold off
end

function [D]=Modify(D_In,Point)
[Tx,Ty,Tz]=size(D_In);

Z1=Point(1,3);
D=zeros(Tx,Ty,Z1);
D(:,:,Z1)=D_In(:,:,Z1);

end


function [D]=Coordinate(Point,Tx,Ty,Tz)
Th=5;
D = zeros(Tx,Ty,Tz);
D(1,1,1)=255; D(Tx,1,1)=255;
D(1,Ty,1)=255;D(1,1,Tz)=255;
D(Tx,Ty,1)=255;D(Tx,1,Tz)=255;
D(1,Ty,Tz)=255;D(Tz,Ty,Tz)=255;
k=0;

for i=1:size(Point,1)
    for x=Point(i,1)-Th:Point(i,1)+Th
        for y=Point(i,2)-Th:Point(i,2)+Th
                D(x,y,Point(i,3))=255;
        end
    end    
end

end





