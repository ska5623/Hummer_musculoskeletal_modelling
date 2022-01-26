function [ang,c] = angleFinderLA_v1(ptsR,ptsT,ax1)

% [ang,c] = angleFinderLA_v1(ptsR,ptsT,ax1)
%
% Finds the rotation about axis ax1 that minimizes the distance between
% ptsR and ptsT

% check for NaNs in pts
if isnan(ptsR(1)+ptsT(1))
  ang=[NaN];
  c=NaN;
  return
end

anonFunc=@(ang)angleScorer_v1(ptsR,ptsT,ax1,ang);

opts=optimset('TolFun',1e-10);
[ang,c]=fminsearch(anonFunc,0,opts);

function [c] = angleScorer_v1(ptsR,ptsT,ax1,ang)


ptsR=angleaxisRotation(ptsR,ax1,ang);

c=norm(ptsR-ptsT);