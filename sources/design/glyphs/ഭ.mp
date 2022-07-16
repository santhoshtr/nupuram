input glyph;
beginglyph;

z0 = ( m/3 , 0);
z1 = ( x0 - m/4 , y0 + m/2 );
z2 = ( x1 + m/2  , y1 + m/2); % top
z3 = ( x2 + m/3, y2 - m/3);
z4 = ( x3 - mw/4, y3-.15m);
z5 = ( x4 + mw/4, y4-.15m);
z6 = ( x5 + m/6, y5-.15m);
z7 = ( x2 , y0);

paths[0] = z0..z1..z2..z3..z4..z5..z6..{dir 160}z7;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3,4  )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5,  6)
    nib(default_nib xyscaled(xthick ,terminalround) rotated 60)( 0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
