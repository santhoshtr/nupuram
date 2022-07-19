input glyph;
beginglyph;

z0 = ( X/4, X);
z1 = ( x0-X/5, X/2 );
z3 = ( x1 + X/5, y1-X/2);

paths[0] = z0..z1..z3;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1 )
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)( 0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
