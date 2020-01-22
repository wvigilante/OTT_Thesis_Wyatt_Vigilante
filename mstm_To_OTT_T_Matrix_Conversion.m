format long g;
fileID = fopen('tm_single_sphere_300.dat','r');
i = sqrt(-1);% not needed
line = 1;
tline = fgets(fileID);
sizeOfMatrix = str2num(tline);
subMatrixSize = (sizeOfMatrix(2).^2) + (2 * sizeOfMatrix);
firstQuad = zeros(subMatrixSize(2),subMatrixSize(2));
secondQuad = zeros(subMatrixSize(2),subMatrixSize(2));% the order in which these quadrants exsist is exactly as a cartesian grid
thirdQuad = zeros(subMatrixSize(2),subMatrixSize(2));
fourthQuad = zeros(subMatrixSize(2),subMatrixSize(2));
overallMatrix = [((subMatrixSize(2))*2);((subMatrixSize(2))*2)]; % constructing the overall matrix
%overallMatrix = [sizeOfMatrix(2);sizeOfMatrix(2)]; % constructing the overall matrix
%disp(overallMatrix);
tline = fgets(fileID);
disp(tline)
while ~feof(fileID)
  line = fgets(fileID); % Read next line
  numLine = str2num(line);
  %Y = sum(X); % checking to make sure that the row vector is of type integer so that they can be summed
  if length(numLine)>5
     n = numLine(1);
     m = numLine(2);
     rowPosInSubMatrix = combined_index(n,m);
     p = 1;
     realPFirst = numLine(3);
     imaginaryPFirst = numLine(4);
     realPSecond = numLine(5);
     imaginaryPSecond = numLine(6);
     if q == 1
         fourthQuad(rowPosInSubMatrix,colPosInSubMatrix) = realPFirst + imaginaryPFirst*i;
         firstQuad(rowPosInSubMatrix,colPosInSubMatrix) = realPSecond + imaginaryPSecond*i;
     else
         thirdQuad(rowPosInSubMatrix,colPosInSubMatrix) = realPFirst +  imaginaryPFirst*i;
         secondQuad(rowPosInSubMatrix,colPosInSubMatrix) = realPSecond + imaginaryPSecond*i; 
     end  
     %firstOutputLen6 = ["m:" + m, "n:" + n,"p:" + pFirst,"k:"+ k,"l:" + l,"q:"+ q,"Real:" + realPFirst,"Imaginary:" + imaginaryPFirst];
     %secondOutputLen6 = ["m:" + m, "n:" + n,"p:" + pSecond,"k:"+ k,"l:" + l,"q:"+ q,"Real:" + realPSecond,"Imaginary:" + imaginaryPSecond];
     %disp(firstOutputLen6);
     %disp(secondOutputLen6);
  end
  if length(numLine)<4
     l = numLine(1);
     nprime = l;
     k = numLine(2);
     mprime = k;
     q = numLine(3);
     colPosInSubMatrix = combined_index(nprime,mprime); %calculating column position
     %outputLen3 = ["l:" + l,"k:"+ k,"q:"+ q];
     %disp(outputLen3)
  else
  end
      
end
%overallMatrix(1:24,25:48) = firstQuad;
%overallMatrix(1:24,1:24) = secondQuad;
%overallMatrix(25:48,1:24) = thirdQuad;
%overallMatrix(25:48,25:48) = fourthQuad;
overallMatrix(1:subMatrixSize(2),(1+subMatrixSize(2)):(subMatrixSize(2)*2)) = firstQuad;
overallMatrix(1:subMatrixSize(2),1:subMatrixSize(2)) = secondQuad;
overallMatrix((1+subMatrixSize(2)):(subMatrixSize(2)*2),1:subMatrixSize(2)) = thirdQuad;
overallMatrix((1+subMatrixSize(2)):(subMatrixSize(2)*2),(1+subMatrixSize(2)):(subMatrixSize(2)*2)) = fourthQuad;
disp(overallMatrix)
disp(overallMatrix(25,25))
disp(overallMatrix(1,1))
fclose(fileID);
function [out1,out2] = combined_index(in1,in2)
%COMBINED_INDEX translates between (n,m) and combined index
% Mode indices and combined index are related by: ci = n * (n+1) + m.
%
% [n,m] = COMBINED_INDEX(ci) calculates (n,m) from the combined index.
%
% ci = COMBINED_INDEX(n,m) calculates the combined index from mode indices.
%
% length = COMBINED_INDEX(Nmax, Nmax) calculates length of the beam vectors.
%
% Nmax = COMBINED_INDEX(length) calculates Nmax from length of beam vectors.
%
% This file is part of the optical tweezers toolbox.
% See LICENSE.md for information about using/distributing this file.

% Sanity check
if nargin == 1
   out1 = floor(sqrt(in1));
   out2 = in1 - out1.^2 - out1;
elseif nargin == 2
   out1 = in1 .* (in1 + 1) + in2;
else
   error('Bad number of input/output arguments');
end
end
