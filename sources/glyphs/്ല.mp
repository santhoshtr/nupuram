input glyph;

beginglyph;
paths[0] = la_sign;
pen_stroke(
    nib(thicknib rotated 0 )(2,4 )
    nib(thinnib rotated 0 )(0, 1, 3, 5, 7)
    nib(terminalnib rotated 30 )(0)
    nib(terminalnib rotated 10 )(infinity)
)(paths[0])(strokes[0]);

anchor( "bottom", (xpart(point 6.5 of paths[0]),0));
anchor( "right", (xpart(point 6.5 of paths[0]),0));
endglyph;