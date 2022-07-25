input glyph;
beginglyph;

z0 = ( m/3, 0);
z1 = ( x0 - m/4, y0 + m/2 );
z2 = ( x1 + m/2, y1 + m/2); % top
z3 = ( x2 + 0.2mw, y2-m/2); % <
z4 = ( x3 + .3mw, y3-.2m);
z5 = ( x2, y3-0.4m);
paths[0] = z0..z1..z2..{left}z3{right}..z4..z5;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1, 4)
    nib(terminalnib rotated 60)(3)
    nib(terminalnib rotated 60)( 0)
    nib(terminalnib rotated 45)(infinity)
)(paths[0])(strokes[0]);

endglyph;
