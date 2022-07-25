input glyph;
beginglyph;
z0 = (0,X+ 0.2X);
z1 = (x0+ 0.1sw, y0 - 0.2X);
paths[0] = z0--z1;
pen_stroke(
    nib(terminalnib rotated 45)(0)
    nib(thinterminalnib rotated 45)(infinity)
)(paths[0])(strokes[0]);
endglyph;
