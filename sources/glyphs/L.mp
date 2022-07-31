input glyph;
beginglyph;
z0=(thick/2, X);
z1=(x0,  y0 - (phi-1)*X);
z2=(x1, thick);
z3=(x2 + 0.8sw, y2);
paths[0] = z0{dir -80} ..z1.. {dir -80}z2 ..{dir 30}z3;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 3, 5 )
    nib(thinnib rotated 0 )(1,   4, 6)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
endglyph;
