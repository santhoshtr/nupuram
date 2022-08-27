input glyph;
beginglyph;
z0 = (0, .125m);
z1 = (x0 + mw/3, 0);
z2 = (x1 + mw/3, y1 + .2m);
z3 = (x1, y2 + .3m);
z4=  (x0, y3 + .275m);
z5=  (x1, m);
z6=  (x2, 0.8m);

paths[0] = z0..z1..z2..z3..z4..z5..z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(1,3,5)
    nib(thinnib rotated 0 )(2,4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0 )
    nib(terminalnib rotated terminalangle infinity of paths[0] )(infinity )
)(paths[0])(strokes[0]);

anchor( "vc", z1);
anchor( "bottom", point 1.75 of paths[0]);
anchor( "right", point 1.75 of paths[0]);

endglyph;
