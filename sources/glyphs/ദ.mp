input glyph;
beginglyph;

paths[0] := da;

pen_stroke(
    nib(thicknib rotated 0 )( 0, 2,4,6 )
    nib(thinnib rotated 0 )( 1, 3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", point 2 of paths[0]);
anchor( "bottom", point 5.25 of paths[0]);
anchor( "right", point 5.25 of paths[0]);

endglyph;
