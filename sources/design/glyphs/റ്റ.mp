input glyph;
beginglyph;
z0=(m/4+thick/2, 0);
z1=(x0- m/4, m/2);
z2=(x0 + m/3, y1 + m/2);
z3=(x2 + m/3, y2-m/2);
z4=(x2, 0);
paths[0] = z0 ..z1..{right}z2..z3 ..z4;
paths[1] = paths[0] shifted (0.1m, -y2  ) xscaled 0.8 yscaled 0.8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 5, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2,   5, 6 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
