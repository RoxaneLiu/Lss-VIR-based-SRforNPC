function [ OutRoi ] = T_ReadCoor_Png( DictName,Suffix)
%�ú������ڶ�ȡROIͼ����Ҫ��png��ʽͼ��
%DictNameΪ·����,����Ӧ�ü�һ��\
%SuffixΪ��׺����'*.png'
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

