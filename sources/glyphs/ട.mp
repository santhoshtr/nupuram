input glyph;
beginglyph;
w_ = phi*mw;
z0 = (0, .15m);
z1 = (x0 + .2w_, y0 - .15m);
z2 = (x1 + .2w_, y1 + .2m);
z3 = (x1, y2 + .35m);
z4=  (x0, y3 + .25m);
z5=  (x1, m);
z6=  (x5 + .15w_, y5 - .15m);

paths[0] = z0..z1..z2..{dir 160}z3{dir 160}..z4..z5..z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(1,3,5)
    nib(thinnib rotated 0 )(2,4)
    nib(terminalnib rotated 60)(0 )
    nib(terminalnib rotated 60 )(infinity )
)(paths[0])(strokes[0]);


endglyph;
