input glyph;
beginglyph;

z0 = ( mw/3, 0);
z1 = ( x0 - mw/4, y0 + m/2 );
z2 = ( x1 + mw/2, y1 + m/2); % top
z3 = ( x2 + mw/3, y2 - m/3);
z4 = ( x3 - mw/3, y3 -.166m);
z5 = ( x4 + mw/3, y4 -.166m);
z6 = ( x5 + mw/6, y5-.15m);
z7 = ( x2, y0);

paths[0] = z0..z1..z2..z3..z4..z5..z6..{dir 160}z7;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3,4  )
    nib(thinnib rotated 0 )(1, 3, 5,  6)
    nib(terminalnib rotated 60)( 0)
    nib(terminalnib rotated 90)(infinity)
)(paths[0])(strokes[0]);

endglyph;
