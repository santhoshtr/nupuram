input glyph;
beginglyph;
z0 = (thick/2, X + m/6);
z1 = (x0+ 0.2sw, y0 - m/3);
z2 = (x1 + 0.2sw, y0);
paths[0] = z0--z1;
paths[1] = z1--z2;
pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(thin,terminalround) rotated 0)( 0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity ) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
