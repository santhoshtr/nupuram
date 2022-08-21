input glyph;
beginglyph;
z0=(x1 + mw/3, 0);
z1=(0, m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, m/3);
z4=(x3, y3-m/4);
% Second arch
z5 = z3;
z6 = (x5 + mw/3, y2- thick);
z7 = (x6 + mw/3, y6 - m/3);
z8 = (x7 - mw/3, y7 - m/2);

paths[0] = z0  ..z1..{right}z2..z3 ---z4;
paths[1] = z5{up}..z6..z7..{dir 200}z8;
paths[2] = va_tail shifted(z8);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (x3,0));
anchor( "bottom", (xpart(point 1 of paths[2]),0));
anchor( "right", (xpart(point 1 of paths[2]),0));

endglyph;
