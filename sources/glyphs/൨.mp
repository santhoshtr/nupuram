input glyph;
beginglyph;
paths[0] := ra;
z5=point infinity of paths[0];
z6=(x5 + 0.6mw, y5);
paths[1] = z5{dir 20}..{dir 20}z6;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 135)(7)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[1])(strokes[1]);

endglyph;
