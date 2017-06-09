 % function:  sumDicePDF
    % purpose:  Calculate the probability function of the sum of dice 
    %           Given n fair dice. Let define X(i) the value 
    %           out in the cube (i).
    %           Define Y(n) = sum(X(i)). 
    %           Calculate the probability function of Y(n). 
    %           Means the P(Y(n) = k)
    %           for given k.
    % input: n - number of dices. n >= 1 (integer)
    %        k - integer betwen n and 6n
    % output: probability - P(Y(n) = k)
    % example: sumDicePDF(3,4) ans = 0.0139
    %          sumDicePDF(8,20) ans = 0.0218
function prob=sumDicePDF(n,k)
    %Check the input 
    if n < 1 || k < n || k > 6*n
        display('Bad Input! Try Again.');
        n = input('n = ');
        k = input('k = ');
        prob=sumDicePDF(n,k);
        return;
    end
    %If there is only one dice return probability 1/6
    if n == 1
        prob = 1/6;
        return;
    end
      %We will use equalition: f(n,k)=sigma(i = 1:6)[f(n-1,k-i)*1/6]. The
      %idea is to create matrix (f(1,1) f(1,2) ... f(1,6n))
      %                         (...... ...... ... .......)
      %                         (f(n,1) f(n,2) ... f(n,6n))
      %And use it to find  out f(n,k) that we need with equalition
      valuesMatix = zeros(n - 1,6*n);  %Define new matrix size n-1,n*6 
                                       %with zeros
      %Fill the first row for 1<x<6 with 1/6 and the rest leave with zeros
      for i = 1:6
          valuesMatix(1,i) = 1/6;
      end
      %Fill the rest of matrix with relivant values 
      for i = 2:n - 1
          for j = i:6*i               
              probForSpecPlace = 0;
              for l = 1:6
                  if j - l > 0 %Check if value out of range becouse 
                               %(k - i) must be positive 
                      %Sum the Probabilites for specific f(n,k)
                      probForSpecPlace = probForSpecPlace + valuesMatix(i - 1,j - l)*1/6;
                  end
              end
              %Put that value in its place in matrix for futher use
              valuesMatix(i,j) = probForSpecPlace;               
          end
      end
      prob = 0; %Define the probability to 0
      %The last module: find the exact value for wanted probability using 
      %the equalition  
      %by using the created matrix of values
      for i = 1:6
          if k - i > 0
              prob = prob + valuesMatix(n - 1,k - i)*1/6;
          end
      end
  end