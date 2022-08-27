input glyph;
beginglyph;
paths[0] := pa_mouth;
paths[1] := pa_tail shifted(xpart(point infinity of paths[0]), 0);

z10= (0, 3/4m);
z11= (xpart(point 3 of paths[0]), y10);
z12= point 2.25 of paths[1];
paths[2] := z10 .. z11{dir -75}.. z12;

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

pen_stroke(
    nib(thinnib rotated 0 )(1)
     nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", point 0.5 of paths[1]);
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);
endglyph;
