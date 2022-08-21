input glyph;
beginglyph;

paths[0] = ra;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", (xpart(point 2 of paths[0]),0));
anchor( "bottom", (xpart(point 4 of paths[0]),0));
anchor( "right", (xpart(point 4 of paths[0]),0));

endglyph;
