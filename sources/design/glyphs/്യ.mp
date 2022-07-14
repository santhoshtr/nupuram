input glyph;
beginglyph;
z0= (u, m);
z1=(x0- 0.1m, y0 - 0.5m);
z2= (x1 + 0.15m , y1 - 0.5m);
z3=( x2 - m/6, y2 - 0.25m);
z4=( x3 - m/6, y3 + m/4);


paths[0] = z0{dir 240}..  z1..  z2..z3{left}..{dir 80}z4;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
