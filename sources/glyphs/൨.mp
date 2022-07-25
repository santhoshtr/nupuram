input glyph;
beginglyph;

z0=(thick/2, -thick/2);
z1=(x0, y0+ m/2);
z2=(x0, y1 + m/2);
z3=(x2 + 0.66mw, y2-0.4m);
z4=(x3 -mw/4, 0);
z5=(x4, 0);
z6=(x5 + 0.6mw, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.5);
paths[0] = z0 ..z1.. z2..{dir -80}z3 ..z4;
paths[1] = z5{dir 30}..{dir 30}z6;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(7)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 115)(infinity)
)(paths[1])(strokes[1]);

endglyph;
