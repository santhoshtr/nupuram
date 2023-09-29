input glyph;
beginglyph;
slant_ := tand(-8);
height_correction :=  thick/4;
z0=(0, m/2);
z1=(x0 + mw/3, m - height_correction);
z2=(x1 + mw/3, y0);
z3=(x2 - mw/3,  height_correction);
paths[0] = z0 .. z1.. z2 .. z3 ..  cycle;
paths[0] := paths[0] xyscaled(1,1) slanted slant_;
paths[0]:= paths[0] shifted (-slant_*m/2, 0);
paths[0]:= subpath(.3, 2.9) of paths[0]   ..  {dir 120}(x0, y0 - m/4);

pen_stroke(
    nib(thinnib)(2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0=(0, (y1+y3)/2);
z1=((x2+x0)/2, m/2);
z2=(x0+mw/2.25 , y0);
z3=(x1, 0);
z4=(x0, y0);

paths[1] = z0{dir 90}..z1{dir 4}..z2{dir 266}..z3{dir 184}..{dir 90}z0;
paths[1] := reverse paths[1];
paths[1] := paths[1] shifted (xpart(point 2 of paths[0]) + 2thick,0);

pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(0, 2, 4)
)(paths[1])(strokes[1]);


endglyph;
