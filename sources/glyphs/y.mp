input glyph;
beginglyph;

paths[0] := u_arch;

z4 = (xpart(point 4 of u_arch) , s + thick/4 );
z5 = (x4, ypart(point 3 of u_arch));
z6 = (x5 - sw/6 , -descent);
z7 = (xpart(point 0 of u_arch), -descent + thick/2);

paths[1] = z4 ..z5 ..  z6..z7;

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
