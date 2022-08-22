input glyph;
beginglyph;
paths[0] := ra;
paths[1] = ra shifted (0.1mw, -m  ) xscaled 0.8 yscaled 0.8;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2,   5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "vc", (xpart(point 2 of paths[0]),0));
anchor( "right", (point 4 of paths[1]));
endglyph;
