input glyph;
beginglyph;

paths[0] := subpath(0, 3.75) of u_arch;

clearxy;
z0 = (xpart(point 4 of u_arch) , s );
z1 = (x0, ypart(point 3 of u_arch));
z2 = (x1 - sw/6 , -descent - thick/2);
z3 = (xpart(point 0 of u_arch), -descent );
paths[1] = z0{dir -100} ..z1  ..  {dir 225}z2.. {dir 120}z3;

pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0] )(0 )
    nib(thinterminalnib rotated terminalangle infinity of paths[0] )(infinity )
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1] )(0 )
    nib(terminalnib rotated terminalangle infinity of paths[1] )(infinity )
)(paths[1])(strokes[1]);
anchor( "top", (xpart(point 2.5 of paths[0]), X) );
endglyph;
