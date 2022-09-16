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
z14 = (x13, m/6);
z15=z13;
z16=(x15 + m/3, y15+m/2);
z17=(x16 + m/3, y16 - m/2);
z18=(x17 - m/3, y17 - m/2);
paths[1] = z11{up}..z12..z13---z14;
paths[2]:= subpath(1, 4) of right_arch shifted(x14, 0);

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

z0=(0, m/2);
z1=(x0 + 0.4mw, y0 + m/2);
z2=(x1 + 0.4mw, y1 - m/2);
z3=(x2 - 0.4mw, y2 - m/2);
z4=z0;

paths[3] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4;
paths[3] := paths[3] crotated -18 shifted(xpart(point 0 of paths[2]), -m) xscaled 0.8 yscaled 0.8;

pen_stroke(
    nib(thicknib rotated 0)(1, 3 )
    nib(thinnib rotated 0)(0, 2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", (xpart(point 1 of paths[1]),0));
anchor( "bottom", point 2.25 of paths[3]);
anchor( "right", point 2.25 of paths[3]);

endglyph;
