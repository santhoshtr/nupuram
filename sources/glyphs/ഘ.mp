input glyph;
beginglyph;
z0=(mw/4, m/4);
z1=(x0 - mw/6, y0 + m/3);
z2=(x0 + mw/6, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x2, y3 - m/4);
z5=(x4, y4);
z6=(x5 + mw, y5);
z7=(x6,  y6 + m/3);
z8=(x7 - mw/4 , y7 + m/3);
z9=(x8 - mw/4 , y8 - m/3);
z10=(x9, y9 - 0.6m);
z11=(x10 + 0.8mw , y10);
z12=(x11, y11 + m/2);
z13=(x12, y12 + m/2);

paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] := z5{dir 30}..{dir 30}z6{up}..z7{up}..{left}z8..z9{dir 280}.. {dir 240}z10{dir 30}..{dir 30}z11{dir 30}..z12...{dir 60}z13;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2,4,7)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 170)(infinity)
)(paths[1])(strokes[1]);

endglyph;
