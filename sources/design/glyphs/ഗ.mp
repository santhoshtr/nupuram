input glyph;
beginglyph;
z0=(m/4 + thick/2, m);
z1=(x0 - m/4, y0 - m/2);
z2=(x1 + m/4, y1 - m/2);
z3=(x2 + m/4, y2 + m/2);
z4=(x3 + m/4, y3 + m/2);
z5=(x4 + m/2, y4 - m/2);
z6=(x5 - m/2, y5 - m/2);

paths[0] = z0..z1..z2..z3..z4..z5..z6;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,5)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[0])( strokes[0]);

endglyph;
