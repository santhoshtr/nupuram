input glyph;
beginglyph;

paths[0] := left_arch_with_eye;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6)
    nib(thinnib rotated 0 )(1,3, 5 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;

z0=point 5 of paths[0];
z1=(x0 + mw/2.5, m-thick/2); % Top of second arch
z2=(x1 + mw/2.5, y1 - m/3);
z3=(x2 - mw/4, 0);
z4=(x3 - mw/4, y3 + m/2);
z5=(x4 + mw/4, y4 + m/2);
z6=(x4, ascent + .1m);

paths[1] = z0{up}..z1..z2..z3 .. z4..{up}z5{up}..{dir 150}z6;
paths[1] := paths[1] slanted tand(8) shifted (-tand(8)*mw/2, 0);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3)
    nib(thinnib rotated 0 )(2,4, 5)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
