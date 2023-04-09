function u = fhan(In)
x1 = In(1);
x2 = In(2);
r = In(3);
h = In(4);

d = r*h;
d0 = h*d;
y = x1+h*x2;
a0 = sqrt(d*d+8*r*abs(y));
if abs(y)>d0
    a = x2+(a0-d)/2*sign(y);
else
    a = x2+y/h;
end
if abs(a)>d
    u = -r*sign(a);
else
    u = -r*a/d;
end
end