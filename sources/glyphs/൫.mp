input glyph;
beginglyph;

paths[0] := subpath(0, 4) of da shifted(mw/3,0);
clearxy;
z0=(xpart(point infinity of paths[0]) + 0.4mw, 0);
z1=(xpart(point 1.8 of paths[0]), -descent);
z2=(xpart(point 1 of paths[0]) - mw/3, m/2);
z3=(x2 + 0.6mw, ascent);
z4=(x3 + 0.6mw, m/2);

paths[0] := paths[0]{right}..z0 ..{left}z1{left}..z2..z3..z4;

pen_stroke(
    nib(thicknib rotated 0 )( 0, 2,4,6 )
    nib(thinnib rotated 0 )( 1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


endglyph;
