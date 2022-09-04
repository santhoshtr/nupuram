input glyph;
beginglyph;
z0 = (x3 - Xw/10, X);
z1 = (0, y4/2);
z2 = (x1 + Xw/3, 0);
z3 = (x2 + Xw/4, y1);
z4 = (x2, 0.6X);
z5 = (thick*0.11, y4/2);
paths[0] := z0..z1..z2..z3..z4..{dir -95}z5;

pen_stroke(
    nib(thicknib rotated 0 )(1 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;