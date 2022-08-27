input glyph;
beginglyph;
paths[0] = pa_mouth;
z5= point infinity of paths[0];
z6=(x5 + mw, y5);
z7=(x6, y6 + m/3);
z8=(x7, 0.8m);

paths[1] := z5{dir 20}..{dir 20}z6{dir 20}..z7..{dir 60}z8;
z11 = point 1.4 of paths[1];
z12 = (x11 - mw/4, -descent);
% z13 = (x12 - mw/3, y12);
z14 = (x12 - mw/3, m/2);
z15 = (x14 + mw/2, m);
z16 = (x15 + mw/2, y15 - 0.5m);
z17 = (x16 - mw/6, -0.2m);
paths[2] = z11{down}..z12 ... z14  .. z15  ..z16 ..z17;
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
    nib(thinnib rotated 0 )(0,2, 4)
    nib(terminalnib rotated (terminalangle infinity of paths[2]))(infinity)
)(paths[2])(strokes[2]);

endglyph;
