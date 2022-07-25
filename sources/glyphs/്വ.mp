input glyph;
beginglyph;

z0 = ( -m/3, -m/4);
z1 = ( x0 + m/2, y0 );
z3 = ( x1, m); % <

paths[0] = z0{dir 0}..{right}z1{dir 100}..  {dir 80}z3;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3,4  )
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 60)( 0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
