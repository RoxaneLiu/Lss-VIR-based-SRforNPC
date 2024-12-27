function [ OutRoi ] = T_ReadRoi_Mat( DictName,Suffix)
% 读取文件夹中的mat格式数据

fileName=strcat(DictName,Suffix);
fileStr=dir(fileName); %
fileName=strcat(DictName,fileStr(1).name);%read mat
st=load(fileName);%
tr=fieldnames(st);%
OutRoi1=getfield(st,tr{1});%
[Tx,Ty,Tz]=size(OutRoi1);
OutRoi=zeros(Tx,Ty,Tz);
for i=1:Tz
   OutRoi(:,:,i)=OutRoi1(:,:,Tz-i+1); 
end

end

