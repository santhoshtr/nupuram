input glyph;

beginglyph;

z0=(4u, m);
z1=(x0 - 0.3m, y0 - 0.5m);
z2=(x1 + 0.3m, y1 - 0.5m);
z3=(x2 + 0.2m, y2 + 0.5m);
z4=(x3 + 0.2m, y3 + 0.4m);
z5=(x4 + 0.5m, y4 - 0.4m);
z6=(x5 - 0.3m, y5 - 0.5m);
z7=(x6 - 0.2m, y6 + 0.25m);
z8=(x7 + 0.2m, y7 + 0.25m);
z9=(x8 + 0.5m, y8 - 0.45m);

z10 = (x9 - .5m , y9 - 0.4m);
z11 = (x10 - m, y10 + 0.3m);
z12 = (x11 - 0.2m, y11 + 0.5m);
z13 = (x12 + 0.2m, y12 + 0.6m);

paths[0]:= z0{dir 215}..z1..z2..z3..z4..z5..z6..z7..z8.. z9.. z10.. z11...z12..z13;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6, 8 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,5,7, 9,11, 12)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
