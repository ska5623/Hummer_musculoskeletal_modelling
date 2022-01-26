function h = drawpatch99(minl, maxl,c,a)
  h = patch([1:99 99:-1:1],[minl flipud(maxl')'],c,'EdgeColor','none','FaceAlpha',a);
end