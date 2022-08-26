input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(mw/3, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y2 + 0.5m);
z4=(x3 + mw/4, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.6m);
z6=(x5 - mw/4, y5 - 0.3m);
z7=(x6 - mw/4, y6 + 0.3m);
z8=(x7 + mw/3, y7 + 0.4m);
z9=(x8 + mw/2, y8 - 0.45m);
z10 = (x4, y9 - 0.6m);
z11 = (x10 - 0.9mw, 0);
z12 = (0, y11 + 0.5m);
z13 = (x12 + thick/2, m);
paths[0] = z0..z1{down} ..{right}z2{right} ..z3..z4..z5 ..z6..z7..z8.. z9{down}.. {left}z10.. z11...z12..z13;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9,11, 12)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", point 4 of paths[0]);
anchor( "bottom", point 9.3 of paths[0]);
anchor( "right", point 9.3 of paths[0]);
endglyph;
