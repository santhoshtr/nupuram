input glyph;
beginglyph;
w := 0.7s;
z0= (u, s);
z1=( x0, y0 - 0.8s);
z2=( x1, y1 - 0.2s);
z3=( x2 - s/5, y2 - s/3);
z4=( x3 - s/5, y3 + s/3);

paths[0] = z0..  z1..  z2..z3{left}..{dir 80}z4;
paths[1] = fullcircle scaled (thick*1.2) shifted(x0, 1.33s);
strokes[1] = paths[1];
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
