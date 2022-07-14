input glyph;
beginglyph;

z0 = ( m/3 , 0);
z1 = ( x0 - m/4 , y0 + m/2 );
z2 = ( x1 + m/2  , y1 + m/2); % top
z3 = ( x2 + 0.2m, y2-m/2); % <
z4 = ( x3 + .3m, y3-.2m);
z5 = ( x2 , y3-0.4m);
paths[0] = z0..z1..z2..{left}z3{right}..z4..z5;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 4)
    nib(default_nib xyscaled(1 ,terminalround) rotated 60)(3) % Sharp cut
    nib(default_nib xyscaled(xthick ,terminalround) rotated 60)( 0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
