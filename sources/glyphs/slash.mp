input glyph;
beginglyph;
w := s/2;
z0= (w, X);
z1=( w/2, y0 - 0.6X);
z2=( 0, y1 - 0.6X);

paths[0] = z0..z1..z2 ;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

endglyph;
