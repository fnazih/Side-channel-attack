start = 1;
finish = 300;
BaseName = '20201208-0001 (';
matrice = [300, 5000];

for i = start:finish
    FileName = [BaseName, num2str(i), ').mat'];
    Data = load (FileName);
    for j = 1:5000
       matrice(i, j) = Data.A(j);
    end
    plot(Data.A);
    hold on;
end

disp(matrice);

