input glyph;
beginglyph;
z0= (u, m);
z1=(x0 + 0.1m, y0 - 0.5m);
z2= (x1 , y1 - 0.6m);
z3=( x2 - m/4, y2 - m/3);
z4=( x3 - m/2, y3 + m/6);
z5=( x4 + m/3, y4 + m/6);
z6=( x5 + m/3, y5 - .1m);

paths[0] = z0 ..  z1..  z2..z3.. z4 ..z5{dir -10}..z6;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2, 5, 4)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
