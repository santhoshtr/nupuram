input glyph;
beginglyph;
save r;
r=0.8;
z0 = (0, s/2);
z1 = (x0 + r*sw/2, s - thick/4);
z2 = (x1 + r*sw/2, y0 );
z3 = (x2 - r*sw/2, thick/4);
paths[0]:= z0{dir 86}..z1{dir 4}..z2{dir 266}..z3{dir 184}..{dir 86}z0;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 1 of paths[0]), X) );
endglyph;
