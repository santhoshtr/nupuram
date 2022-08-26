input glyph;
beginglyph;
z0 = (0,X+ 0.2X);
z1 = (x0+ 0.1sw, y0 - 0.2X);
paths[0] = z0--z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 1 of paths[0]), X) );
endglyph;
