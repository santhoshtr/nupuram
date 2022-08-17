input glyph;
beginglyph;

w_ = phi*sw;
z0 = (0, .15s);
z1 = (x0 + .2w_,   thick/4);
z2 = (x1 + .2w_, y1 + .2s);
z3 = (x1, y2 + .35(s-thick/2));
z4=  (x0, y3 + .25(s-thick/2));
z5=  (x1, s - thick/4);
z6=  (x5 + .15w_, y5 - .1s);

paths[0] =z0..z1..z2..z3..z4..z5..z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(0,1, 3)
    nib(thinnib rotated 0 )(2, 4)
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 60)(infinity )
)(paths[0])(strokes[0]);


endglyph;
