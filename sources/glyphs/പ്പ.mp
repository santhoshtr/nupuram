input glyph;
beginglyph;
paths[0] := pa_mouth;


pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

paths[1] := pa_tail shifted(xpart(point infinity of paths[0]), 0);

pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


clearxy;
z0= (0, 0.8m);
z1= (xpart(point 3 of paths[0]), y0);
z2= point 2.5 of paths[1];
paths[2] := z0{dir 45} ..z1{dir -45} .. {dir 45} z2;

pen_stroke(
    nib(thinnib rotated 0 )(1)
     nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", point 0.5 of paths[1]);
anchor( "bottom", point 1 of paths[1]);
anchor( "right", point 1 of paths[1]);
endglyph;
