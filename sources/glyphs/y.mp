input glyph;
beginglyph;

z0 = (3/4thick , s);
z1 = (x0 - thick/4 , y0 - s/2);
z2 = (x1 + sw/4, thick/4);
z3 = (x0 + 3/4*sw, y1 );

paths[0] = z0 ..z1.. z2 ..{dir 80}z3;

z4 = (x3 , s );
z5 = (x4  , y1);
z6 = (x5 - sw/6 , y5 - 0.9s);
z7 = (x1, y6 + s/4);

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
