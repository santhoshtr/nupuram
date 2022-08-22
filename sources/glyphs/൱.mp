input glyph;
beginglyph;

z0= (.5thick, -thick/2);
z1=(x0 , y0 + 0.5m);
z2=(x0, y1 + 0.5m);
z3=(x2 + mw/2 , y2 - 0.4m);
z4=(x3 , thick/2);

paths[0] = z0  ..z1 .. z2 .. z3{down}...z4;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2)
    nib(thinnib rotated 0 )(1, 3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


z5=z3;
z6=(x5 + mw/4, y5+mw/2);
z7=(x6 + mw/3, y6-mw/2);
z8=(x7 - mw/2, y7-0.8mw);

paths[1] = z5{up}..z6..z7..z8;

pen_stroke(
    nib(thicknib rotated 0 )(1)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
