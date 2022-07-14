input glyph;
beginglyph;
z0 = (.5m, 0.75m);
z1 = (x0 + .25m, y0 + 0.25m);
z2 = (x1 + .25m, y1 - 0.5m);
z3 = (x2 - .5m, y2 - 0.5m);
z4 = (x3 - .5m, y3 + 0.5m);
z5 = (x4 + .2m, y4 + 0.4m);
z6 = (x5 + .35m, y5 - 0.3m);
z7 = (x6 + 0.2m, y6-0.4m);
z8 = (x7 + 0.3m, y3);
z9 = (x8 + 0.25m, y8+ 0.5m);
z10 = (x9, y9 + 0.5m);
paths[0] = z0{up}..z1..z2..z3..z4..z5..z6..z7..z8..z9..{dir 45}z10;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1,3,5,8 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2,4,6, 7, 9)
    nib(default_nib xyscaled(xthick,terminalround) rotated 150)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
