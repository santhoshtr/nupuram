input glyph;
beginglyph;

um = 0.75m;
z0=(2.3u, m);
z1=(x0 - 0.3m, y0 - 0.5um);
z2=(x1 + 0.3m, y1 - 0.5um);
z3=(x2 + 0.2m, y2 + 0.5um);
z4=(x3 + 0.2m, y3 + 0.4um);
z5=(x4 + 0.5m, y4 - 0.4um);
z6=(x5 - 0.3m, y5 - 0.5um);
z7=(x6 - 0.2m, y6 + 0.25um);
z8=(x7 + 0.2m, y7 + 0.25um);
z9=(x8 + 0.3m, y8);
paths[0] = z0{dir 215}..z1..z2..z3..z4..z5..z6..z7..z8.. z9;
paths[1] = paths[0] scaled(0.8) shifted (0.25m, -.666m);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6, 8 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,5,7, 9)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6, 8 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,5,7, 9)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
