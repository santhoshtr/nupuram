input glyph;
beginglyph;
save r,e;
r=0.85;
z0=(sw*r, 0.75s);
z1=(0.5sw*r,s-thick/4);
z2=(0, s/3);
z3=( 0.4*sw*r, thick/4);
z4= (sw*r, s/4);

paths[0]:=z0{dir 100}..{dir 190}z1 ..z2{dir -80}..z3{dir -10} ..{dir 60}z4;
z5 = point 1.8 of paths[0];
paths[0]:=z5{dir -20}..paths[0];

pen_stroke(
    nib(thicknib rotated 0 )(2,4)
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 2 of paths[0]), X) );
endglyph;
