str = '';
for i = 1:10
    for j = 1:10
        str = sprintf('%s%dx%d=%d\n', str, i, j, i*j);
    end
    str = sprintf('%s\n', str);
end
str
