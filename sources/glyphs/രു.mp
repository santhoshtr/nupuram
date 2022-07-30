input glyph;
beginglyph;

z0=(0.3m+.5thick, 0);
z1=(x0 - 0.3mw, y0 + m/2);
z2=(x1 + mw/2, y1 + m/2);
z3=(x2 + mw/2, y2 - m/2);
z4=(x3 - 0.3mw, y3 - m/2);
z5=(x4 - mw/5, y4 + m/2);
z6=(x5 + 3/4mw, y5 + m/2);
z7=(x6 + mw/4, y6 - m/4);
z8=(x7 - mw/4, y7 - m/4);


paths[0] = z0..z1..z2..z3..z4..z5..z6..z7..z8 ;

z10 = z8;
z11 = (x10 + mw/3, y10 - m/4);
z12 = (x11 - mw/2, y11 - m/4);

paths[1] = z10..z11..z12 ;


pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4)
    nib(thinnib rotated 0 )(1, 3, 5,7)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[1])(strokes[1]);

endglyph;
