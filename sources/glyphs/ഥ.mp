input glyph;
beginglyph;
z0=(x1 + mw/8, m);
z1=(0, m/2);
z2=(x1 + 0.5mw, 0);
z3=(x2 + 0.3mw, 0);
z4=(x3 + 0.5mw, m/2);
z5=(x4 - mw/3, m);
z6=(x5 - mw/3, m/3);
% Could be y2, but that will create a self intersection and hence will
% confuse outline calculation.
z7=(x6 + mw/6, y3+0.05m);

paths[0] = z0 ..z1..{dir -10}z2..z3{dir 10}..z4..z5..z6..z7;
pen_stroke(
    nib(thicknib rotated 0 )(2, 3, 4 )
    nib(thinnib rotated 0 )(1, 4, 6 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", (xpart( point 2.5 of paths[0]),0));
anchor( "bottom", point 3.6 of paths[0]);
anchor( "right", point 3.6 of paths[0]);

endglyph;
