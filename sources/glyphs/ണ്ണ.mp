input glyph;
beginglyph;

paths[0] :=left_arch_with_eye;
pen_stroke(
    nib(thicknib)(0, 2, 4, 6)
    nib(thinnib)(1,3, 5)
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
    nib(thicknib)(1, 3)
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib)(1,3)
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

xshift := 0.6mw;
yshift := -.85m;
paths[3] = paths[0] shifted (xshift , yshift) xscaled 0.8 yscaled 0.8;
paths[4] = paths[1] shifted (xshift , yshift) xscaled 0.8 yscaled 0.8;
paths[5] = paths[2] shifted (xshift , yshift) xscaled 0.8 yscaled 0.8;
pen_stroke(
    nib(thicknib)(0, 2, 4, 6)
    nib(thinnib)(1,3, 5)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[4])(0)
    nib(terminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);
pen_stroke(
    nib(thicknib)(1,3)
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[5])(0)
    nib(terminalnib rotated terminalangle infinity of paths[5])(infinity)
)(paths[5])(strokes[5]);
rbearing:=0;
endglyph;
