input glyph;
beginglyph;

z0 = ( m/3, 0);
z1 = ( x0 - mw/4, y0 + m/2 );
z2 = ( x1 + mw/3, y1 + m/2); % top
z3 = ( x2 + mw/4, y2-m/2); % <
z4 = ( x3 + mw/3, y3 -.2m);
z5 = ( x4 - mw/3, y3-0.4m);
paths[0] = z0..z1..z2..{left}z3{right}..z4..{left}z5;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1, 4)
    nib(terminalnib rotated 60)(3)
    nib(terminalnib rotated 60)( 0)
    nib(terminalnib rotated 45)(infinity)
)(paths[0])(strokes[0]);


z20 = z5;
z21 = (x20 + m/3, y20 - m/4);
z22 = (x21 - m/3, y21 - m/4);

paths[1] = z20..z21..z22 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[1])(strokes[1]);

endglyph;
