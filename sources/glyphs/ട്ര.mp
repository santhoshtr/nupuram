input glyph;
beginglyph;
z0 = (x4, 0.8m);
z1 = (x5, m);
z2 = (0, y3 + .275m);
z3 = (x5, y4 + .3m);
z4 = (x5 + mw/3, y5 + .2m);
z5 = (x2 + mw/3, 0);
z6 = (x2-mw/4, y3);
z7 = (x6 + mw/8, m);

paths[0] = z0..z1..z2..z3..z4..z5..z6..z7;
paths[0]:= paths[0] shifted(mw/4, 0);

pen_stroke(
    nib(thicknib rotated 0 )(1,3,5)
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0 )
    nib(terminalnib rotated terminalangle infinity of paths[0] )(infinity )
)(paths[0])(strokes[0]);

anchor( "vc", z1);
anchor( "right", point 4.5 of paths[0]);

endglyph;
