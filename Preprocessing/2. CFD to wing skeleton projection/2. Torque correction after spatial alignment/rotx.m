function R = rotx(a)
a = pi*a/180;
R = [1 0 0;
    0 cos(a) -sin(a); 
    0 sin(a) cos(a)];
