Z14=0.01+0.1*1i;
Z24=0.03+0.3*1i;
Z34=0.03+0.3*1i;
Zc2=1/(0.3*1i);
Zc3=1/(0.3*1i);


Z1 = (Z34+Zc3)*Z14/(Z34+Zc3+Z14);
Z2 = Z1+Z24;
Zth2=Z2*Zc2/(Z2+Zc2);
abs(Zth2);
SCR2 = 1/abs(Zth2)/0.32