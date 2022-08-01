input glyph;
beginglyph;
z0=( sw/5 + thick/4, s);
z1=(x0  - sw/5, s/3);
z2=(x1 + sw/5, thick/4);
z3=(x2 + sw/3, y2 + s/3);
z4=(x3 , 2/3s);
z5=(x4  , y4 - 0.3s);
z6=(x5 + sw/3, thick/4);
z7=(x6 + sw/4, y6 + s/3);
z8=(x7 - sw/4 , s);

paths[0] = z0 ..z1.. z2..z3..{up}z4 ;
paths[1] = z4{down}  ..z5..z6 ..z7..{dir 135}z8 ;

pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 150)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[1])(strokes[1]);

endglyph;
