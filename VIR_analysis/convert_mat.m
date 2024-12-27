function[b] = convert_mat(a)

% 将读取的mat三维图像转化为二值三维图像

t = load(a.name).RoiOut;
b = t/max(max(max(t)));
