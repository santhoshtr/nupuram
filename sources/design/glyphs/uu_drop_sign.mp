input glyph;
beginglyph;
soften := 0;
z0=(0.2mw,  0);
z1=(x0 + 0.2mw, y0 - 0.2m);
z2=(x1 - 0.2mw, y1 - 0.2m);
z3=(x2 - 0.2mw, y2 + 0.2m);
z4=(x3 + 0.2mw, y3 + 0.2m);
z5=(x4 + 0.4mw, y4 - 0.3m);
z6=(x5 - 0.45mw, y5 - 0.3m);

paths[0] = z0..tension 1.2..z1 ..z2{left}..z3..tension 1.2..z4..tension 1.2..z5..z6 ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 1, 3, 4, 5)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(1, terminalround) rotated 60)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

anchor( "right", z0);

endglyph;
