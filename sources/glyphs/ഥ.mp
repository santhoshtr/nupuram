input glyph;
beginglyph;
z0=(x1 + mw/8, m);
z1=(0, m/2);
z2=(x1 + 0.6mw, 0);
z3=(x2 + 0.6mw, m/2);
z4=(x3 - mw/3, m);
z5=(x4 - mw/3, y4 - m*0.3);
z6=(x5 + mw/6, y2);

paths[0] = z0 ..z1..{right}z2{right}..z3..z4..z5..z6;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4 )
    nib(thinnib rotated 0 )(1,   3, 5)
    nib(terminalnib rotated 150)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", (xpart( point 2 of paths[0]),0));
anchor( "bottom", point 2.5 of paths[0]);
anchor( "right", point 2.5 of paths[0]);

endglyph;
