function [ OutRoi ] = T_ReadCoor_Png( DictName,Suffix)
%该函数用于读取ROI图像，主要是png格式图像。
%DictName为路径名,后面应该加一个\
%Suffix为后缀，如'*.png'
fileName=strcat(DictName,Suffix);
fileStr=dir(fileName);%

%open
fileNum=size(fileStr);
fileName=strcat(DictName,fileStr(1).name);
OutRoi=imread(fileName);

for i=2:fileNum
    fileName=strcat(DictName,fileStr(i).name);
    Roi=imread(fileName);
    OutRoi=cat(3,OutRoi,Roi);    
end
end

