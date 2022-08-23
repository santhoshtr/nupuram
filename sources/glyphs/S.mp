input glyph;
beginglyph;

r = 0.8;
z0 = (0, .15X);
z1 = (x0 + Xw/2*r, 0);
z2 = (x1 + Xw/2*r, y1 + .2X);
z3 = (x1, y2 + .3X);
z4=  (x0 + .025Xw, y3 + .2X);
z5=  (x1 + .025Xw, X);
z6=  (x5 + .4Xw*r, y5 - .1X);

paths[0] = z0 ..z1..z2.. z3..z4..z5.. z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(0,1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


endglyph;
