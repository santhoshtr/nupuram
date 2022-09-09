input glyph;
beginglyph;
z0 = (0, 0.6s);
z1 = (0.75sw, y0);
z2 = (x1, y0- s/3);
paths[0] = z0{dir 20} .. {dir -20}z1{dir -70}..z2;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
endglyph;
