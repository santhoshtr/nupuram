input glyph;
beginglyph;
z0=(0, s);
z1=(x0 + sw/5, y0 - 0.5s);
z2=(x1 + sw/5, y1 - 0.5s);
z3=(x1 + sw/2.4, y2 + 0.5s);
z4=(x3, y3 + 0.3s);
z5=(x4 + sw/8, y4 - 0.3s);
z6=(x5 + sw/5, y5 - 0.5s);
z7=(x6 + sw/5, y6 + 0.5s);
z8=(x7 , y7 + 0.5s);

paths[0] = z0{dir -45}..z1..{dir -45}z2 ;
paths[1] = z2{dir 45}..z3..z4 ;
paths[2] = z4{dir -45}..z5..z6 ;
paths[3] = z6{dir 45}..z7..z8 ;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 30)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 30)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[3])(strokes[3]);
endglyph;
