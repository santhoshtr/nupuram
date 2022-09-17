input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y1);
z4=(x3 + mw/2, m);
z5=(x4 + mw/3, m/2);
z6=(x5 - mw/2, 0);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{dir -10}z4..{dir -100}z5..{dir 190}z6;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])( strokes[0]);

paths[1]:=paths[0] shifted(0.55m, -0.88m) xscaled 0.8 yscaled 0.7;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1,3, 5,7)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])( strokes[1]);
rbearing:=-2*rbearing;
anchor( "vc", point 3.5 of paths[0]);
anchor( "bottom", (xpart(point 5 of paths[0]), 0));
endglyph;
