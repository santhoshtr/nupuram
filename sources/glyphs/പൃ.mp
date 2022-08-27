input glyph;
beginglyph;
paths[0] := pa_mouth;
paths[1] := pa_tail shifted(xpart(point infinity of paths[0]), 0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
% ഋ sign
z0 = point 1.45 of paths[1];
z1 = (x0 - mw/2, -descent - thick);
z2 = (x1 - mw/3, -descent * .8);
z3 = (x0 - mw/4, -descent);
paths[2] = z0{dir -80}..z1..z2{dir 75}..{dir -45}z3;
pen_stroke(
    nib(thinnib rotated 0 )(2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


anchor( "vc", point 2 of paths[0]);
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);
endglyph;
