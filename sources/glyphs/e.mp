input glyph;
beginglyph;

paths[0] = e_loop;

pen_stroke(
    nib(thicknib rotated 0 )(2,4)
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 2 of paths[0]), X) );
endglyph;
