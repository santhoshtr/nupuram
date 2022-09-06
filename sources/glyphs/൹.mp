input glyph;
beginglyph;

z0=(2.5u, 0);
z1=(x0 -2u, y0  + 0.5m);
z2=(x1 + 1.5u, y1 + 0.4m);
z3=(x2 + 2u, y2 - m*0.5);
z4=(x3, 1u); % bottom of piller
z5=(x3, y3);
z6=(x5 + mw/2, y5 + .6m); % Top of second arch
z7=(x6 + mw/3, y6 - m/2);
z8= ( x7 - mw/3, y7 - m/2);
z9= ( x8 - mw/4, y8 + m/4);
z10= ( x9 + mw, y9+ m/4);

paths[0] = z0..  z1..z2.. z3---z4 ;
paths[1] = z5{up}..tension 1 ..z6..z7..z8..z9{up}.. {dir -20} z10;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3, 5)
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
