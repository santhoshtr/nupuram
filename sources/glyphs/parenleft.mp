input glyph;
beginglyph;

z0 = ( X/4, X);
z1 = ( x0 - X/5, y0-X/2 );
z3 = ( x0, y1-X/2);

paths[0] = z0..z1..z3;

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
