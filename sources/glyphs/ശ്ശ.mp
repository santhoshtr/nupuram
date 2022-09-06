input glyph;
beginglyph;

z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y2 + 0.5m);
z4=(x3 + mw/4, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.6m);
z6=(x5 - mw/4, y5 - 0.3m);
z7=(x6 - mw/4, y6 + 0.3m);
z8=(x7 + mw/3  + thick/2, y7 + 0.4m);

paths[0] = z0..z1{down} ..{right}z2{right} ..z3..z4..z5 ..z6..z7..{right}z8 ;
paths[1] = paths[0]  xscaled 0.8 yscaled 0.75 shifted (0.25mw, -.666m);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
)(paths[1])(strokes[1]);
anchor( "vc", point 4 of paths[0]);

endglyph;
