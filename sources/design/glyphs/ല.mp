input glyph;
beginglyph;
z0=(1.5u, m/2);
z1=(x0 + mw/2, y0+m/6);
z2=(x1 - mw/3, m);
z3=(x2 - mw/3, m/3);
z4=(x3 + mw/3, 0);
z5=(x4 + 2/3mw, y3);
z6=(x5 - mw/8, y2);


paths[0] = z0 ..z1.. z2..z3 .. z4 ..z5.. z6;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3, 5)
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;