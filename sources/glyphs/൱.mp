input glyph;
beginglyph;

z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/3, y1 +  0.4m);
z3=(x2 + mw/3, m/3);
z4=(x3,  y3 -m/4); % bottom of piller
paths[0] = z0..z1.. z2.. {down}z3---z4 ;

z5=(x3, y3);
z6=(x5 + mw/2, m); % Top of second arch
z7=(x6 + mw/3, y6 - m/2);
z8= ( x7 - mw/2, -descent);

paths[1] = z5{up}..z6..z7..{left}z8;
paths[1]:= paths[1] slanted tand(8) shifted (-tand(8)*mw/3, 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
