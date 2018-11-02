function output = runsewe_16bitalu()

bitNum = 16;
fileID_in = fopen('runsewe_16bitaluin.txt', 'w'); 
fileID_out = fopen('runsewe_16bitaluout.txt', 'w'); 

range = (2 ^ bitNum) - 1;
for i = 0:range 
    for p = 0:3
        selector = dec2bin(p, 2);

        op_a = dec2bin(i, bitNum);
        op_b = dec2bin(range - i, bitNum);

        if selector == '00'
        output = dec2bin(i + (range - i), 16);
        
        elseif selector =='01'
         output = op_b; % not op_a 
        
        elseif selector == '10'
        output = dec2bin(bitand(i, (range-i)), 16);
        
        else  
        output = dec2bin(bitor(i, (range-i)), 16);
        end
    fprintf(fileID_in, '%s\r\n', [op_a ' ' op_b ' ' selector]);
    fprintf(fileID_out, '%s\r\n', output); 
    end
end 
        
fclose(fileID_in); 
fclose(fileID_out);
    