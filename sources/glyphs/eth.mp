input glyph;
beginglyph;
% This is glyph '6'
z0 = (x3 - Xw/10, X);
z1 = (0, y4/2);
z2 = (x1 + Xw/3, 0);
z3 = (x2 + Xw/4, y1);
z4 = (x2, 0.6X);
z5 = (thick*0.13, y4/2);
paths[0] := z0..z1..z2..z3..z4..{dir -95}z5;
paths[0] := paths[0] xyscaled(-1, 1) shifted(x3,0);

pen_stroke(
    nib(thicknib)(1)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
% Stroke at top
clearxy;
z0=(xpart(point 2 of paths[0]), ypart(point 0.5 of paths[0]));
z1=(xpart(point 1 of paths[0]), X);
paths[1]:=z0..z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;