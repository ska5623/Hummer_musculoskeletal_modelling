function h = drawpatch(minl, maxl,c,a)
  h = patch([1:100 100:-1:1],[minl flipud(maxl')'],c,'EdgeColor','none','FaceAlpha',a);
end