function R = roty(a)
a = pi*a/180;
R = [cos(a) 0 sin(a); 
     0 1 0;
    -sin(a) 0 cos(a)];
