input glyph;
beginglyph;

clearxy;
z0=(0, 0);
z1=(x0 + 1.1mw, y0);
z2=(x1, y1 + m/2);
z3=(x2, y2 + m/2);
paths[1] := z0{dir 20}..{dir 20}z1{dir 20}..z2...{dir 60}z3;

clearxy;
z0=(x1 + mw/10, m/3);
z1=(xpart(point 0.1 of paths[1]), y0 + m/4);
z2=(x1 + mw/3, 0.85m);
z3=(x0 + mw/2, y0 + m/6);
z4=point 0 of paths[1];

paths[0] = z0{dir 135}..z1..{dir -10}z2..z3 .. {dir 200}z4;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", point 2 of paths[0]);
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);

endglyph;
