%data handling
function wdata(file,data)
%data = textread(file);
fileID = fopen(file,"w");
fprintf(fileID, num2str(data));
fclose(fileID);
