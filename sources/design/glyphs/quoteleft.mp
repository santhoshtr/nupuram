input glyph;
beginglyph;
z0 = (thick/2, X + m/6);
z1 = (x0+ 0.05sw, y0 - m/3);
paths[0] = z0.. {dir -45}z1;
pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
