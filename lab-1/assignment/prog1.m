mat = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]
out = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]

for i = 1:4
    for j = 1:4
        if j > i
            out(i,j) = mat(i,j);
        end
    end
end

out