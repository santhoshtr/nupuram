input glyph;
beginglyph;

w_ = phi*Xw;
z0 = (0, .1X);
z1 = (x0 + .2w_, y0 - .1X);
z2 = (x1 + .2w_, y1 + .2X);
z3 = (x1, y2 + .35X);
z4=  (x0, y3 + .25X);
z5=  (x1, X);
z6=  (x5 + .15w_, y5 - .1X);

paths[0] = z0{dir -30}..z1..z2..{dir 160}z3..z4..z5..{dir -30}z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(0,1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 60)(infinity )
)(paths[0])(strokes[0]);


endglyph;
