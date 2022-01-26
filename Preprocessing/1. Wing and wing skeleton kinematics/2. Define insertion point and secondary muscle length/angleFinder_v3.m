function [angs] = angleFinder_v3(pts,tvec,ax1,ax2)

% [angs] = angleFinder_v3(pts,tvec,ax1,ax2);
%
% Finds a set of angles for rotations about ax1 and then ax2 that minimizes
% the angle between pts and tvec.  Mathematical (rather than fminsearch)
% solution.

% check for NaNs in pts
if isnan(pts(1)+tvec(1))
  angs=[NaN,NaN];
  return
end

% get first angle
angs(1)=getAngle(pts,tvec,ax1);


% rotate pts and ax2 by angs(1)
ax2a=angleaxisRotation(ax2,ax1,angs(1)); 
pts2=angleaxisRotation(pts,ax1,angs(1));

% get 2nd angle
angs(2)=getAngle(pts2,tvec,ax2a);% correction

% avoid imaginary output at the canonical frame
angs=real(angs);


function [a] = getAngle(pts,tvec,ax1)


% project tvec into the plane of ax1
tvecP1=tvec-dot(tvec,ax1)*ax1;
ptsP1 = pts - dot(pts,ax1)*ax1; % correction

% find the angle between pts and tvecP1
a1=acos(dot(ptsP1./norm(ptsP1),tvecP1./norm(tvecP1))); % correction

% rotate pts by a1 and -a1
pts1a=angleaxisRotation(pts,ax1,a1);
pts1b=angleaxisRotation(pts,ax1,-a1);

% compute angles from pts1a and pts1b to tvec
ad1=acos(dot(pts1a./norm(pts1a),tvec./norm(tvec)));
ad2=acos(dot(pts1b./norm(pts1b),tvec./norm(tvec)));

% pick the better one
if ad1>ad2
  a=-a1;
else
  a=a1;
end
