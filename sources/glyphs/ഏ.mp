input glyph;
beginglyph;
paths[0] = pa_mouth;
z5= point infinity of paths[0];
z6=(x5 + mw, y5);
z7=(x6, y6 + m/3);
z8=(x7, 0.8m);

paths[1] := z5{dir 20}..{dir 20}z6{dir 20}..z7..{dir 60}z8;
clearxy;
z0 = point 1.4 of paths[1];
z1 = (x0 - mw/4, -descent);
% z13 = (x12 - mw/3, y12);
z2 = (x1 - mw/3, m/2);
z3 = (x2 + mw/2, m);
z4 = (x3 + mw/2, y3 - m/4);
z5 = (x4 - mw/4, y4- m/3);
z6 = (x5 + mw/3, y5- m/4);
z7 = (x6 - mw/3, y6- m/3);
paths[2] = z0{down}..z1 ... z2  .. z3  ..z4 ..{left}z5{right}..z6..z7;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated (terminalangle infinity of paths[0]))(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated (terminalangle infinity of paths[1]))(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3, 5)
    nib(thinnib rotated 0 )(0, 2, 4, 6)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle 5 of paths[2])(5)
    nib(terminalnib rotated (terminalangle infinity of paths[2]))(infinity)
)(paths[2])(strokes[2]);

endglyph;
