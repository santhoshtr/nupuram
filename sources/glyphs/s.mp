input glyph;
beginglyph;

r = 0.75;
z0 = (0, y1 + .15s);
z1 = (x0 + sw/2*r, thick/4);
z2 = (x1 + sw/2*r, y1 + .25s);
z3 = (x1, y2 + .2s);
z4=  (x0 + .03sw, y3 + .2s);
z5=  (x1 + .025sw, s - thick/4);
z6=  (x5 + .4sw*r,  y5 - 0.12s);

paths[0] = z0{dir -30}  ..z1..z2.. z3 ..z4..z5..   z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "top", (xpart(point 1 of paths[0]), X) );
anchor( "bottom", (xpart(point 1 of paths[0]), 0) );
endglyph;
