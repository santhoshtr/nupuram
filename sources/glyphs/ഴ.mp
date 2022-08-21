input glyph;
beginglyph;
z0 = (0.2m , m);
z1 = (x0 - .2mw, y0 - m/3);
z2 = (x1 + .45mw, y1 - m/3);
z3 = (x2 + .45mw, y2 + m/3);
z4 = (x3 - .3mw, y3 + m/3);
z5 = (x4 - .3mw, y4 - .3m);
z6 = (x5 + .2mw, y5 - .3m);
z7 = (x6 + .2mw, y6 - .2m);
z8 = (x7 - .4mw, y7 - .2m);
paths[0] = z0..z1..z2..z3..z4..z5..z6 ..z7..{dir 135}z8;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 8 )
    nib(thinnib rotated 0 )(1,3, 5,6, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", (x4,0));
anchor( "bottom", (x7,0));
anchor( "right", (x7,0));

endglyph;

