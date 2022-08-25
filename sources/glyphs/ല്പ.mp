input glyph;
beginglyph;
z0=(1.5u, m/2);
z1=(x0 + mw/2, y0+m/6);
z2=(x1 - mw/3, m);
z3=(x2 - mw/3, m/3);
z4=(x3 + mw/3, 0);
z5=(x4 + 2/3mw, y3);
z6=(x5 - mw/8, y2);


paths[0] = z0 ..z1.. z2..z3 .. z4 ..z5.. z6;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z10=(mw/4, -0.6m );
z11=(x10 - mw/6, y10 + m/3);
z12=(x10 + mw/6, y11 + m/4);
z13=(x12 + mw/4, y12 - m/4);
z14=(x13- mw/5, y10 );
z15=(x14, y10);
z16=(x15 + 3/4mw, y15);
z17=(x16, y16 + m/2);
z18=(x17, y17 + m/2);

paths[1] = z10{dir 135}..z11..{right}z12..z13{dir 260}..z14;
paths[2] := z15{dir 30}..{dir30}z16{dir 30}..z17...{dir 60}z18;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (x2,0));

endglyph;