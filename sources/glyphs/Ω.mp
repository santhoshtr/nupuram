input glyph;
beginglyph;

paths[0] = ra shifted(mw/4, 0);
paths[0] := origin -- paths[0] -- (xpart(point infinity of paths[0]) + mw/2, 0);
pen_stroke(
    nib(thinnib rotated 0 )(2,4 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
