% DEVANAGARI STRESS SIGN UDATTA -
% Vedic tone svarita

input glyph;
beginglyph;
z0 =(0, y1 + .4m);
z1 =(0, m*1.1);
paths[0] = z0--z1;
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
rbearing:= 0;
lbearing:= 0;
endglyph;
