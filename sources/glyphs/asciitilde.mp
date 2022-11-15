input glyph;
beginglyph;
z0 = (0, 0.5X);
z1 = ((x0+x2)/2, y0);
z2 = (sw, y0);
paths[0] = z0{dir 60} ..{dir -30}z1{dir -30}.. {dir 60}z2;
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
endglyph;
