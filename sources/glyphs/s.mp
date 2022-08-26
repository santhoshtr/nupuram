input glyph;
beginglyph;

r = 0.8;
z0 = (0, .15s);
z1 = (x0 + sw/2*r, 0);
z2 = (x1 + sw/2*r, y1 + .2s);
z3 = (x1, y2 + .3s);
z4=  (x0 + .025sw, y3 + .2s);
z5=  (x1 + .025sw, s);
z6=  (x5 + .4sw*r, y5 - .1s);

paths[0] = z0 ..z1..z2.. z3..z4..z5.. z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "top", (xpart(point 1 of paths[0]), X) );
anchor( "bottom", (xpart(point 1 of paths[0]), 0) );
endglyph;
