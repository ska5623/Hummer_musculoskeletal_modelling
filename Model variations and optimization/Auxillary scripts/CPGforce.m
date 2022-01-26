% This function is used for generating CPG profiles with <100% active
% period and given phase shift (using presaved data files for
% computational efficiency).


function [Fcpgpos, Fcpgneg] = CPGforce(s1, s2, pshift, sshift, phi, phi2)
s1z = int16(100*round(s1,2));
s2z = int16(100*round(s2,2));
if s1z == 0
   s1z = 1; 
end
if s2z == 0
   s2z = 1; 
end

NT = 100;
Out1 = load(['CPGdata\dataCPG' num2str(s1z) '.mat']);
Out2 = load(['CPGdata\dataCPG' num2str(s2z) '.mat']);  
Xop = Out1.Xo;
Xos = Out2.Xo;
      
      L = length(Xop);
      ze = 0;
      i1p = 0;
      i2p = 0;
      Xotempp = zeros(1,L);
      
      for i = 2:1:L
        if Xop(1,i) >= 0 && Xop(1,i-1) < 0
          ze = ze+1; 
        end
        if ze == 5 && i1p == 0
          i1p = i; 
        end
        if ze == 6 && i2p == 0
          i2p = i; 
        end
        if ze >=5 && ze <=6 && Xop(i) >0
           Xotempp(1,i) = Xop(i);
        end
      end
      
      L = length(Xos);
      ze = 0;
      i1s = 0;
      i2s = 0;
      Xotemps = zeros(1,L);
      
      for i = 2:1:L
        if Xos(1,i) >= 0 && Xos(1,i-1) < 0
          ze = ze+1; 
        end
        if ze == 5 && i1s == 0
          i1s = i; 
        end
        if ze == 6 && i2s == 0
          i2s = i; 
        end
        if ze >=5 && ze <=6 && Xos(i) <0
           Xotemps(1,i) = Xos(i);
        end
      end
            
      Xotrimmedptemp = Xotempp(1,i1p:i2p);
      Xotrimmedstemp = Xotemps(1,i1s:i2s);
      
      Xotrimmedp = zeros(1,i2p - i1p+1);
      Xotrimmeds = zeros(1,i2s - i1s+1);
      
      for i = 1:1:i2p - i1p+1
         indexp = round(i/pshift);
         if indexp > i2p - i1p+1
             indexp = i2p - i1p-20;
         end
         Xotrimmedp(1,i) =   Xotrimmedptemp(1,indexp); 
      end
      
      sstarti = 0;
      for i = 1:1:i2s - i1s
         if Xotrimmedstemp(1,i+1)<0 && Xotrimmedstemp(1,i) == 0
            sstarti = i;    
         end
      end
      
      for i = sstarti:1:i2s - i1s
         indexs = sstarti + round((i-sstarti)/sshift);
         if indexs > i2s - i1s+1
             indexs = 20;
         end
         Xotrimmeds(1,i) =   Xotrimmedstemp(1,indexs); 
      end
      
      range = min(i2p-i1p+1,i2s-i1s+1);      
      C = 0:1/(range-1):1;
      Fcpgpostemp = interp1(C,interp1(1:i2p-i1p+1,Xotrimmedp,1:range),0:1/(NT-1):1);
      Fcpgnegtemp = interp1(C,interp1(1:i2s-i1s+1,Xotrimmeds,1:range),0:1/(NT-1):1);
       
      phaseshift = round(NT*rem(phi+phi2+1,1));
      Fcpgpos(1,1:NT-phaseshift) = Fcpgpostemp(1,phaseshift+1:NT);
      Fcpgpos(1,NT-phaseshift+1:NT) = Fcpgpostemp(1,1:phaseshift);
      Fcpgneg(1,1:NT-phaseshift) = Fcpgnegtemp(1,phaseshift+1:NT);
      Fcpgneg(1,NT-phaseshift+1:NT) = Fcpgnegtemp(1,1:phaseshift);
end