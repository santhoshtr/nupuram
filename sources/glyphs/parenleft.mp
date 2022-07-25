input glyph;
beginglyph;

z0 = ( X/4, X);
z1 = ( x0-X/5, X/2 );
z3 = ( x1 + X/5, y1-X/2);

paths[0] = z0..z1..z3;

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated 120)( 0)
    nib(terminalnib rotated 60)(infinity)
)(paths[0])(strokes[0]);

endglyph;
