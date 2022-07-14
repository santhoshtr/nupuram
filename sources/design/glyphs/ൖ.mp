input glyph;
beginglyph;
z0 = (0.2m, m);
z1 = (x0 - .2m, y0 - m/3);
z2 = (x1 + .6m, y1 - m/3);
z3 = (x2 + .6m, y2 + m/3);
z4 = (x3 - .3m, y3 + m/3);
z5 = (x4 - .3m, y4 - .3m);
z6 = (x5 + .2m, y5 - .3m);
z7 = (x6 + .2m, y6 - .2m);
z8 = (x7 - .4m, y7 - .2m);
z9 = (x8 - .3m, y8 + .5m);
z10 = (x9 + .3m, y9 + .5m);
z11 = (x10 - .4m, y10 + .3m);
paths[0] = z0..z1..z2..z3..z4..z5..z6 ..z7..z8..z9..z10{up}..z11;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6, 8 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3, 5, 7, 9,10 )
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
