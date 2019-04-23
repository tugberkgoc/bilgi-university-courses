%try different fs: fs = 4, fs = 10, fs= 20
fs = 100 %lots of samples, better reconstruction
t = [0:1/fs:1]
x1 = sin(2*pi*t)
x2 = sin(10*pi*t)
x3 = sin(18*pi*t)

plot(t,x1, t,x2, t,x3)