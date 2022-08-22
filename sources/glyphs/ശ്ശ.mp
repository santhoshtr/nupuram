input glyph;
beginglyph;

um = 0.75m;
z0=(2.3u, m);
z1=(x0 - mw/4, y0 - 0.5um);
z2=(x1 + mw/4, y1 - 0.5um);
z3=(x2 + 0.2mw, y2 + 0.5um);
z4=(x3 + 0.2mw, y3 + 0.4um);
z5=(x4 + mw/2, y4 - 0.4um);
z6=(x5 - m/3, y5 - 0.5um);
z7=(x6 - 0.2mw, y6 + 0.25um);
z8=(x7 + 0.2mw, y7 + 0.25um);
z9=(x8 + mw/4, y8);
paths[0] = z0{dir 215}..z1..z2..z3..z4..z5..z6..z7..z8.. z9;
paths[1] = paths[0] scaled(0.8) shifted (0.25mw, -.666m);
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
endglyph;
