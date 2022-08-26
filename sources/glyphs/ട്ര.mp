input glyph;
beginglyph;
w_ = phi*mw;
z7 = (x0 + mw/4, m);
z0 = (0, mw/2);
z1 = (x0 + .28w_, -thick);
z2 = (x1 + .4w_, .2m);
z3 = (x2 - 0.3w_, y2 + .30m);
z4=  (x3 - 0.2w_ + mw/20, y3 + .30m);
z5=  (x4+ 0.2w_, m);
z6=  (x5 + .2w_, y5 - .15m);

paths[0] = z7{dir -140} ..z0{down}..z1..z2..z3..z4..z5..z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(1,3,5)
    nib(thinnib rotated 0 )(2,4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0 )
    nib(terminalnib rotated terminalangle infinity of paths[0] )(infinity )
)(paths[0])(strokes[0]);

anchor( "vc", z1);
anchor( "bottom", point 2.5 of paths[0]);
anchor( "right", point 2.5 of paths[0]);

endglyph;
