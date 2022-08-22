input glyph;
beginglyph;

z0=(mw/8 + thick/2, 0.9m);
z1=(x0 - mw/8, y0 - m/3);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y2 + m/2);
z4=(x3 + mw/3, m);
z5=(x4 + mw/2, y4 - m/2);
z6=(x5 - mw/4, y5 - m/2.4);
z7=(x6 - mw/4, y6 + m/2);
z8=(x7 + mw/4, y7 + m/2);
z9=( x7, ascent + .1m);

paths[0] = z0..z1..z2..z3..z4..z5..z6..z7..z8..z9 ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6 )
    nib(thinnib rotated 0 )(1,3,5,7,8)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

endglyph;
