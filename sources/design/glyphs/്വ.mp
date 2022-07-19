input glyph;
beginglyph;

z0 = ( -m/3, -m/4);
z1 = ( x0 + m/2, y0 );
z3 = ( x1, m); % <

paths[0] = z0{dir 0}..{right}z1{dir 100}..  {dir 80}z3;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3,4  )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)( 0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
