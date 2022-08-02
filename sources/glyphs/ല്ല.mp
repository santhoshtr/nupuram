input glyph;
input malayalam

beginglyph;

paths[0] = la;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3, 5)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[0])(strokes[0]);

paths[1] = la_sign shifted (xpart(point 3 of la), 0);
pen_stroke(
    nib(thicknib rotated 0 )(2,4 )
    nib(thinnib rotated 0 )(0, 1, 3,   5, 7)
    nib(terminalnib rotated 30 )(0)
    nib(terminalnib rotated 30 )(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", (xpart(point 2 of paths[0]),0));
anchor( "bottom", point 7 of paths[1]);
anchor( "right", point 7 of paths[1]);

endglyph;