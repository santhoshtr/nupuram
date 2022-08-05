input glyph;
beginglyph;

paths[0] = subpath (1.25, 2.6) of right_arch xyscaled(1.25, 1) shifted(thick/2, 0)  ;

paths[0] := (mw/5, m/5).. paths[0];
z5=(xpart(point 1 of paths[0]) - thick/2, 0);
paths[0] :=  paths[0]..{dir 200}z5;
z6=( (xpart(point 3 of paths[0]) ) + thick/2, y5);
z7=(x6, y6 + m/4);
z8=(x7, y7 + m/2);

paths[1] = z5{dir 10}..{dir 10}z6{dir 60}..z7... z8;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3,4)
    nib(terminalnib rotated 20)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 4 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);


anchor( "vc", (xpart(point 2 of paths[0]),0));
anchor( "bottom", z6);
anchor( "right", z6);

endglyph;
