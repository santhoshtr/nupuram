input glyph;
beginglyph;


z0 = (thick/2 , s );
z1 = (x0, s/2);
z2 = (x1 , 0);

paths[0] = z0{dir -80} ..z1 .. {dir -80}z2;

z3 = z1;
z4 = (x0 + sw/2 , s-thick/4);


paths[1] = z3{dir 80} ..{right} z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 30 )(0 )
    nib(terminalnib rotated 0 )(infinity )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated 0 )(0 )
    nib(terminalnib rotated 90 )(infinity )
)(paths[1])(strokes[1]);
endglyph;
