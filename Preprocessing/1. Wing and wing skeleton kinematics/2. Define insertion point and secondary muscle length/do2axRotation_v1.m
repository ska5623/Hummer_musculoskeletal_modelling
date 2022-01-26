function [pts,ax2a]=do2axRotation_v1(pts,ax1,ax2,angs)

% function [pts,ax2a]=do2axRotation_v1(pts,ax1,ax2,angs)

pts1=angleaxisRotation(pts,repmat(ax1,size(pts,1),1),angs(1));
ax2a=angleaxisRotation(ax2,ax1,angs(1)); 

pts=angleaxisRotation(pts1,repmat(ax2a,size(pts1,1),1),angs(2));
