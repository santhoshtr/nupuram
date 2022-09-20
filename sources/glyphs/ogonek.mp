input glyph;
beginglyph;
z0 = (x1 + sw/4, 0);
z1 = (0, (y0+y2)/2);
z2 = (x1 + sw/3, -descent);
paths[0] := z0{left}..z1..{right}z2;
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "bottom", (xpart(point 0 of paths[0]), 0) );
endglyph;