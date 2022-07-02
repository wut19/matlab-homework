function ds = myodefun(t,s)
G = 6.672E-11;
ME = 5.97E24;

xy = s(1:2);
vxvy = s(3:4);
r = sqrt(xy'*xy);
ds = [vxvy;-G*ME*xy/r^3];
return