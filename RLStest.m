h = 0.5.^[0:3]';
x = randn(1000,1);
y = conv(h,x);

[e,w,P] = RLS(x,y,h);
