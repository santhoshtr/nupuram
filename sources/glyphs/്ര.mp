input glyph;
beginglyph;

z0 = (mw/4, m);
z1 = ( x0, 0 );
z3 = ( x1 + m/3, y1-m/3);

paths[0] = z0..z1..z3;

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated 120)( 0)
    nib(terminalnib rotated 60)(infinity)
)(paths[0])(strokes[0]);
rbearing:=-x1;
endglyph;
