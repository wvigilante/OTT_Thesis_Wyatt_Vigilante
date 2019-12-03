format long g;
fileID = fopen('tm_bisphere_300_diff_file.txt','r');
line = 1;
tline = fgets(fileID);
disp(tline)
tline = fgets(fileID);
disp(tline)
while ~feof(fileID)
  line = fgets(fileID); % Read next line
  numLine = str2num(line);
  if length(numLine)>5
     n = numLine(1);
     m = numLine(2);
     pFirst = 1;
     realPFirst = numLine(3);
     imaginaryPFirst = numLine(4);
     pSecond = 2;
     realPSecond = numLine(5);
     imaginaryPSecond = numLine(6);
     firstOutputLen6 = ["m:" + m, "n:" + n,"p:" + pFirst,"k:"+ k,"l:" + l,"q:"+ q,"Real:" + realPFirst,"Imaginary:" + imaginaryPFirst];
     secondOutputLen6 = ["m:" + m, "n:" + n,"p:" + pSecond,"k:"+ k,"l:" + l,"q:"+ q,"Real:" + realPSecond,"Imaginary:" + imaginaryPSecond];
     disp(firstOutputLen6);
     disp(secondOutputLen6);
  end
  if length(numLine)<4
     l = numLine(1);
     k = numLine(2);
     q = numLine(3);
     outputLen3 = ["l:" + l,"k:"+ k,"q:"+ q];
     disp(outputLen3)
     %disp(line);
  else
  end
      
end
fclose(fileID);


%A = A';
% tm_bisphere_300
% open file
% read line 1
% read line 2 
% read line
% if line has 3 numbers: l k q
% if line has 6 numbers: 
    % 1st num is n
    % 2nd num is m
    % 3rd/4th T print m n p k l q read and imaginary 
    % 5th/6th T print m n p k l q real and imaginary
% if line has 4 numbers do nothing