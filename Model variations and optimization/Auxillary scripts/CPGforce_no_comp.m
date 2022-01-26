% This function is used for generating CPG profiles with 100% active period
% and given phase shift (using presaved data files for computational
% efficiency).

function [Fcpgpos, Fcpgneg] = CPGforce_no_comp(s1, s2, phi, phi2)
s1z = int16(100*round(s1,2));
s2z = int16(100*round(s2,2));
if s1z == 0
   s1z = 1; 
end
if s2z == 0
   s2z = 1; 
end

NT = 100;
Out1 = load(['CPGdata\dataCPGc' num2str(s1z) '.mat']);
Out2 = load(['CPGdata\dataCPGc' num2str(s2z) '.mat']);  


Fcpgpostemp = spline(0:1/1444:1,Out1.Fcpgpostemp,0.01:0.01:1);
Fcpgnegtemp = spline(0:1/1444:1,-1*Out2.Fcpgnegtemp,0.01:0.01:1);

      phaseshift = round(NT*rem(phi+phi2+0.28+1,1));
      Fcpgpos(1,1:NT-phaseshift) = Fcpgpostemp(1,phaseshift+1:NT);
      Fcpgpos(1,NT-phaseshift+1:NT) = Fcpgpostemp(1,1:phaseshift);
      Fcpgneg(1,1:NT-phaseshift) = Fcpgnegtemp(1,phaseshift+1:NT);
      Fcpgneg(1,NT-phaseshift+1:NT) = Fcpgnegtemp(1,1:phaseshift);
end