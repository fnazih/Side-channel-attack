start = 1;
finish = 300;
TracesFile = '20201208-0001 (';
pText = fopen('pText.txt', 'r');
sbox = fopen('sbox_dec.txt', 'r');
sbox_matrix = fscanf(sbox, '%d');
matrix_traces = [300, 5000];
new_matrix_bruit = [300, 5050];
matrix_consump_hyp = [256, 300, 16];
corr_matrix = [300, 256, 16];
key = "";

%Displaying EM consumption traces
for pTextNumber = start:finish
    FileName = [TracesFile, num2str(pTextNumber), ').mat'];
    Data = load (FileName);
    noise = randi(50);
    for j = 1:noise
       new_matrix_bruit(pTextNumber, j) = 0;
    end
    for j = 1:5000
       matrix_traces(pTextNumber, j) = Data.A(j); 
       new_matrix_bruit(pTextNumber, j + noise) = Data.A(j);
    end
end

plot(transpose(matrix_traces(:, 1000)));
hold on;
plot(transpose(new_matrix_bruit(:, 1000)));


%Creating matrix of consumption hypothesis

% pTextData = fscanf(pText, '%2x', [16, 300]);
% hold off;
% 
% for k = 1:16
%     for keyByte_value = 1:256
%         for pText_value = start:finish
%             data = pTextData(k, pText_value);
%             xor_res = bitxor(data, keyByte_value - 1);  %calculating hyp. keyByte XOR pTextByte
%             result = sbox_matrix(xor_res + 1);  %performing sBox transformation
%             hamming_weight = sum(dec2bin(result)=='1'); %calculating Hamming weight
%             matrix_consump_hyp(keyByte_value, pText_value, k) = hamming_weight;    %returning hyp. consump. matrix
%         end
%     end
%     corr_matrix = corr(transpose(matrix_consump_hyp(:, :, k)), new_matrix_bruit);   %correlating matrixes
%     subplot(4, 4, k);
%     plot(corr_matrix);
%     [row, column] = find(corr_matrix == max(max(corr_matrix)));     %finding max in every matrix
%     
%     keyByte = dec2hex(row - 1, 2);
%     key = key + append(keyByte);
% end


%disp(corr_matrix);
%disp(matrix_consump_hyp);

disp("Key value : " + key);