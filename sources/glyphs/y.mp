input glyph;
beginglyph;

paths[0] := u_arch;

z4 = (xpart(point 3 of u_arch) , s );
z5 = (x4, ypart(point 3 of u_arch));
z6 = (x5 - sw/6 , y5 - 0.9s);
z7 = (xpart(point 1 of u_arch), y6 + s/4);

paths[1] = z4 ..z5 ..  z6..z7;

pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 0 )(0 )
    nib(thinterminalnib rotated 0 )(infinity )
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0 )(0 )
    nib(terminalnib rotated 30 )(infinity )
)(paths[1])(strokes[1]);

endglyph;
