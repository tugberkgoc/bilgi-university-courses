%Question01
a = 10
b = 2.5 * 10^25
c = 4 + 3i
d = exp((2 * pi * i)/ 3)

%Question02
aVec = [3.14 16 19 26]
bVec = [2.71 ; 8 ; 28 ; 182]
cVec = [5.0 : -0.2 : -5]
dVec = logspace(0,1,100)
eVec = "Hello"

%Question03
aMat = zeros(9) + 2
bMat = zeros(9) + diag([1 2 3 4 5 4 3 2 1])
cMat = reshape(1:100, [10 10])
dMat = nan(3,4)
eMat = reshape([13 -22 -1 10 5 -87], [2 3])
fMat = reshape([floor(-3 + (7)*rand(15,1))], [5 3])

%Question04
x = 1 / (1 + exp(-(a - 15)/ 6))
y = (sqrt(a) + b^(1/21))^ pi
c = log(real((c + d)*(c - d)) * sin(a * pi / 3)) / c * conj(c)

%Question05
xVec = (1 / sqrt(2 * pi * (2.5)^2)) * (exp((-cVec).^2) ./ (2 * (2.5)^2))
yVec = sqrt((aVec.').^2 + bVec.^2)

%Question06
xMat = (aVec * bVec)*(aMat^2)
yMat = bVec * aVec

%Question07
cSum = sum(cMat)
eMean = mean(eMat)
eMat(1, :) = ones(1, 3)
cSub = cMat(2:9, 2:9)
eFunction = reshape(bsxfun(@times, reshape(1:20, [2 10]), [1; -1]), [1 20])
fFunction = reshape([floor(-3 + (7)*rand(5,1))], [1 5])
fFunction(fFunction<0.5) = 0