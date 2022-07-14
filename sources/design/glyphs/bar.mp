input glyph;
beginglyph;
w := s/2;
z0= (0, X);
z1=( x0, y0 - 0.6X);
z2=( x1, y1 - 0.6X);

paths[0] = z0..z1..z2 ;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
