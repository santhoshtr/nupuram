input glyph;
beginglyph;
z0=(x1 + mw/3, 0);
z1=(0, m/2);
z2=(x1 + mw/3, y1 + m/2);
z3=(x2 + mw/3, m/3);
z4=(x3, y3-m/4);


paths[0] = z0  ..z1..{right}z2..z3 ---z4;
paths[0] := paths[0] shifted (mw/3, 0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

% Second arch
z5 = point 3 of paths[0];
z6 = (x5 + mw/3, y2- thick);
z7 = (x6 + mw/3, y6 - m/3);
z8 = (x7 - mw/3, y7 - m/2);
paths[1] = z5{up}..z6..z7..{dir 200}z8;

pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

paths[2] = va_tail shifted(z8);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


clearxy;
z0 = point 1.5 of paths[2];
z1 = (xpart(point 2 of paths[1]), -descent - thick/2  );
z2 = (xpart(point 0 of paths[0]), -descent - thick/4);
z3 = (xpart(point 1 of paths[0]) - mw/3, ypart(point 1 of paths[0]));
z4 = (x3 + mw/10, m);

paths[3] = z0{dir -75} ..{dir 190}z1  ..z2{dir 170} ..z3..z4;
pen_stroke(
    nib(thinnib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);


anchor( "vc", (x3,0));
anchor( "bottom", point 0.75 of paths[3]);
anchor( "right", point 0.75 of paths[3]);

endglyph;
