input glyph;
beginglyph;
w := s/2;
z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.1X);
z3=( x2, y2 - 0.5X);

paths[0] = z0..z1;
paths[1] = z2..z3 ;

pen_stroke(

    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)     nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);


endglyph;
