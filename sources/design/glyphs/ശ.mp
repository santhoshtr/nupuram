input glyph;
beginglyph;
z0=(m/4 + thick/2, m);
z1=(x0 - mw/4, y0 - m/2);
z2=(x1 + mw/4, y1 - m/2);
z3=(x2 + mw/4, y2 + m/2);
z4=(x3 + mw/4, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.4m);
z6=(x5 - m/3, y5 - m/2);
z7=(x6 - 0.2mw, y6 + 0.25m);
z8=(x7 + 0.2mw, y7 + 0.25m);
z9=(x8 + mw/4, y8);

paths[0] = z0{dir 215}..z1..z2..z3..z4..z5..z6..z7..z8.. z9;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated 135)(0)
)(paths[0])(strokes[0]);
endglyph;
