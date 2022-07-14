input glyph;
beginglyph;
w := 0.8s;
z0= (0, s);
z1=( x0, y0 -  s);
z2=( x1, y1 -  0.5s);
z3 = (x0, s - 0.3s);
z4 = (x3 + w/2, y0);
z5 = (x4 + w/2, y4 - 0.3s );
z6 = (x3, 0);
paths[0] = z0{dir -60}..z1..  z2 ;
paths[1] = z3{dir 60}..z4..z5..{left}z6;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
