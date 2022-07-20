input glyph;
beginglyph;
z0 = (0,X+ 0.2X);
z1 = (x0+ 0.1sw, y0 - 0.2X);
paths[0] = z0--z1;
pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 45)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
