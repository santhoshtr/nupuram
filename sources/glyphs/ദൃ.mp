input glyph;
beginglyph;

paths[0] := subpath(0, 4) of da;

clearxy;
% ഋ sign
z0 = (xpart(point infinity of paths[0]) + mw/2, 0);
z1 = (x0 - mw/2, -descent - thick);
z2 = (x1 - mw/4, -descent * .8);
z3 = (x0 - mw/6 - thick/5, -descent * .8);
paths[0] := paths[0]{right}..z0..z1..z2{dir 75}..{dir -50}z3;
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
