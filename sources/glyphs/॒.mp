
% DEVANAGARI STRESS SIGN ANUDATTA
% Vedic tone anudatta
input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
paths[0] = (-0.75sw, -descent)--(0, -descent);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
rbearing:= 0;
lbearing:= 0;
endglyph;
