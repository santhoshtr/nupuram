input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m);
z5=(x4 + mw/3, y4-m/4);
z6=(x5 - mw/3, y5-m/4);
z7=(x6 + mw/2.5, y6-m/4);
z8=(x7 - mw/2, y7-m/4);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{right}z4..z5..{left}z6{right}..z7..{dir 160}z8;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 6 of paths[0])(6)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

anchor( "vc", point 5 of paths[0]);
anchor( "bottom", point 7.5 of paths[0]);
anchor( "right", point 7.5 of paths[0]);
endglyph;
