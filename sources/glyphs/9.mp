input glyph;
beginglyph;
z0 = (0, 3/4X);
z1 = (x0+ Xw/3, X);
z2 = (x1+ Xw/4, y0);
z3 = (x0 + Xw/10, 0);
z4 = (x1, 0.4X);
z5 = (x2 - thick*0.12, y2);
paths[0] := z5..z4..z0.. z1..z2.. z3;

pen_stroke(
    nib(thicknib)(1)
    nib(thinnib)(2,4)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;