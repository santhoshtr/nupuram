input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
paths[0] = fullcircle scaled (thick*1.5) shifted(thick/2, s/2);
strokes[0] = paths[0];
endglyph;
