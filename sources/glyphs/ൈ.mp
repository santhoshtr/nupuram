input glyph;
beginglyph;
z0=(0.045mw, 0.6m);
z1=(x0 + mw/2, y0 - m/4);
z2=(x1 - mw/4,  thick/2);
z3=(0, 0.5m);
z4=(x3 + mw/2, m);
z5=(x4 + mw/2.4, m/2);
z6=(x5 - mw/6, 0);
paths[0]:=z0  .. z1{down}..z2{left}..z3.. z4..{down}z5..z6;
pen_stroke(
    nib(thinnib)(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

paths[1]:= paths[0] shifted(xpart(point 5 of paths[0]) + thick, 0);

pen_stroke(
    nib(thinnib)(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
