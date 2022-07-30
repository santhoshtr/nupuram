input glyph;
beginglyph;

z0=(mw/4, m/4-thick/4);
z1=(x0 - mw/6, y0 + m/3);
z2=(x0 + mw/6, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x2, y0+thick/4);
z5=(x4, y4);
z6=(x5 + 0.6mw, y5);
z7=(x6+ mw/2,  y6 + m/6);
z8=(x7 - mw/3 , m);
z9=(x8 - mw/3 , m/3);
z10=(x9+ mw/3, 0);
z11=(x10 + 2/3mw , y6);
z12=(x11, m);


paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] := z5{dir 30}..z6..z7..z8..z9.. z10..z11..z12;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2,4,6)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", (x6,0));
anchor( "bottom", (x11,0));
anchor( "right", (x11,0));

endglyph;
