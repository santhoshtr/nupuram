input glyph;
beginglyph;

paths[0] := ra;
paths[1] := va_tail shifted (point 4 of paths[0]) ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 170)(infinity)
)(paths[1])(strokes[1]);


anchor( "vc", (xpart(point 2 of paths[0]),0));
anchor( "bottom", (xpart(point 1 of paths[1]),0));
anchor( "right", (xpart(point 1 of paths[1]),0));


endglyph;
