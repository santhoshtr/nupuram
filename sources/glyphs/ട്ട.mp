input glyph;
beginglyph;
z0 = (0, .125m);
z1 = (x0 + mw/3, 0);
z2 = (x1 + mw/3, y1 + .2m);
z3 = (x1, y2 + .3m);
z4=  (x0, y3 + .275m);
z5=  (x1, m);
z6=  (x2, 0.8m);
paths[0] = z0..z1..z2 ..z3..z4..z5.. z6 ;

z10 = z1;
z11 = (x2  + thick/2, y10 - m/4);
z12 = (x3, y11 - m/4);
z13 = (x0 - thick/2, -descent);

paths[1] = z10{right}  ..z11..z12 .. z13 ;

pen_stroke(
    nib(thicknib rotated 0 )(0,1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", point 1 of paths[0]);
anchor( "right", (xpart(point 1.25 of paths[1]), ypart(point 1.4 of paths[1])));

endglyph;
