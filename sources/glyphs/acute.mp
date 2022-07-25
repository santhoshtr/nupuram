input glyph;
beginglyph;
z0 = (0, X);
z1 = (x0+ 0.1sw, y0 + 0.2X);
paths[0] = z0-- z1;
pen_stroke(
    nib(thinterminalnib rotated 135)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[0])(strokes[0]);
endglyph;
