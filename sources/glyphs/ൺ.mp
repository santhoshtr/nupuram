input glyph;
beginglyph;
paths[0] :=left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
% Second arch
z11 = point 5 of paths[0];
z12 = (x11 + mw/4, y11 + m/2.5);
z13 = (x12 + mw/4, y12 - m/3);
z14 = (x13, y13 - m/2.5);
z15=z13;
z16=(x15 + mw/3, y15+m/2);
z17=(x16 + mw/2, y16 - m/2);
z18=(x17 - mw/4, y17 - m/2);
z19=(x18 - mw/4, y18 + m/2);
z20=(x19 + mw/4, y19 + m/2);
z21=( x19, ascent + .1m);
paths[1] = z11{up}..z12..z13---z14;
paths[2] = z15{up}..z16..z17...z18..z19..z20..z21;

pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2,4,5)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
