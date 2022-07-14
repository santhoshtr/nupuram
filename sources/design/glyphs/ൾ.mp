input glyph;
beginglyph;

z0=(m/4, m);
z1=(x0 - m/4, y0 - m/2);
z2=(x1 + m/3, y1 - m/2);
z3=(x2 + m/4, y2 + m/2);
z4=(x3 + m/4, y3 + m/2);
z5=(x4 + m/2, y4 - m/2);
z6=(x5 - m/3, y5 - m/2);
z7=(x6 - m/4, y6 + m/2);
z8=(x7 + m/4, y7 + m/2);
z9=( x8 - m/2, y8 + m/4);

paths[0] = z0..z1..z2..z3..z4..z5..z6..z7..z8..z9 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,5,7,8)
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])( strokes[0]);

endglyph;
