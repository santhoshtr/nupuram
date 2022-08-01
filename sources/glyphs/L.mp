input glyph;
beginglyph;
z0=(thick/2, X);
z1=(x0,  2/3s);
z2=(x1, 0);

z3=(x2, thick/2);
z4=(x3 + Xw/phi, y3);
paths[0] = z0{dir -80} ..z1.. {dir -80}z2;
paths[1] = z3{dir 10}..{dir 10}z4;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 3, 5 )
    nib(thinnib rotated 0 )(1,2 )
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 10)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
