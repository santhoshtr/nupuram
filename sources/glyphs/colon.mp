input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
paths[0] = fullcircle scaled (thick*1.5) shifted(0, .8s);
paths[1] = paths[0] shifted(0, -0.5s);
strokes[0] = paths[0];
strokes[1] = paths[1];
lbearing := lbearing + thick/2;
rbearing := rbearing + thick/2;
endglyph;
