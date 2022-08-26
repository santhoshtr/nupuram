input glyph;
beginglyph;

paths[0] := subpath(0, 4) of da shifted(mw/3,0);
z6=(xpart(point infinity of paths[0]) + 0.4mw, 0);
z7=(xpart(point 1.8 of paths[0]), -descent);
z8=(xpart(point 1 of paths[0]) - mw/3, m/3);
z9=(x8 + mw/6, m);
paths[0] := paths[0]{right}..z6 ..{left}z7{left}..z8..{dir 60}z9;

pen_stroke(
    nib(thicknib rotated 0 )( 0, 2,4,6 )
    nib(thinnib rotated 0 )( 1, 3, 5, 7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "vc", point 2 of paths[0]);
anchor( "bottom", point 5.25 of paths[0]);
anchor( "right", point 5.25 of paths[0]);

endglyph;
