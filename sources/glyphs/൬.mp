input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3,  y3 -m/4); % bottom of piller
paths[0] = z0..z1.. z2.. {down}z3---z4 ;
% Second arch
z11 = z3;
z12 = (x11 + mw/4, y11 + m/3);
z13 = (x12 + mw/4, y3);
z14 = (x13, y4);
paths[1] = z11{up}..z12..z13---z14;

z15=z13;
z16=(x15 + mw/2, m);
z17=(x16 + mw/3, y16 - m/2);
z18=(x17 - mw/2, -descent);


paths[2] = z15{up}..z16..z17...z18;
paths[2] := paths[2] slanted tand(8) shifted (-tand(8)*mw/3, 0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2,4,6 )
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
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "vc", (xpart(point 1 of paths[1]),0));
endglyph;
