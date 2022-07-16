input glyph;
beginglyph;
z0=(m/2 + thick/2, m);
z1=(x0 - mw/4, y0 - m/2);
z2=(x1 + mw/4, y1 - m/2);
z3=(x2 + mw/4, y2 + m/2);
z4=(x3 + mw/4, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.4m);
z6=(x5 - 0.3mw, y5 - 0.5m);
z7=(x6 - 0.2mw, y6 + 0.25m);
z8=(x7 + 0.2mw, y7 + 0.25m);
z9=(x8 + 0.5mw, y8 - 0.45m);
z10 = (x9 - .5m , y9 - 0.4m);
z11 = (x10 - mw, y10 + 0.3m);
z12 = (x11 - 0.2mw, y11 + 0.5m);
z13 = (x12 + 0.2mw, y12 + 0.6m);
paths[0] = z0{dir 215}..z1..z2..z3..z4..z5..z6..z7..z8.. z9.. z10.. z11...z12..z13;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6, 8 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,5,7, 9,11, 12)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
