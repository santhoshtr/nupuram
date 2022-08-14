input glyph;
beginglyph;
paths[0] := subpath(0,4) of left_arch_with_eye;
paths[0] := paths[0] ..(mw, m/2){down}..(0.7mw, 0);
paths[1] := va_tail shifted point infinity of paths[0];
pen_stroke(
    nib(thicknib rotated 0 )(2,4,6)
    nib(thinnib rotated 0 )(1,3, 5)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 115)(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 170)(infinity)
)(paths[1])(strokes[1]);
endglyph;
