input glyph;
beginglyph;
z0=(0.045mw, 0.6m);
z1=(x0 + mw/2, y0 - m/4 );
z2=(x1 - mw/4,  thick/2);
z3=(0, 0.5m);
z4=(x3 + mw/2, m);
z5=(x4 + mw/2.4, m/2);
z6=(x5 - mw/6, 0);
paths[0]:=z0  .. z1{down}..z2{left}..z3.. z4..{down}z5..z6;
pen_stroke(
    nib(thinnib rotated 0 )(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


clearxy;
slant_ := tand(-8);
height_correction := thick/4;
z0=(0, m/2);
z1=(x0 + mw/3, m - height_correction);
z2=(x1 + mw/3, y0);
z3=(x2 - mw/3,  height_correction);
paths[1] = z0 .. z1.. z2 .. z3 ..  cycle;
paths[1] := paths[1] xyscaled(1,1) slanted slant_;
paths[1]:= paths[1] shifted (-slant_*m/2, 0);
paths[1]:= subpath(.3, 2.9) of paths[1]   ..  {dir 120}(x0, y0 - m/4);
paths[1]:= paths[1] shifted (xpart(point 5 of paths[0]) + 2thick,0);
pen_stroke(
    nib(thinnib rotated 0 )(2 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
