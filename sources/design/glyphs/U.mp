input glyph;
beginglyph;
w := 0.7X;
z0=(0, X);
z1=(x0, y0 - 0.5X);
z2=(x1 + w/2, y1 - 0.5X);
z3=(x2 + w/2, y2 + 0.5X);
z4=(x3 - w/4, y3 + 0.5X);
paths[0] = z0{dir 290}..z1..z2..z3.. z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 10)(0)
    nib(terminalnib rotated 10)(infinity)
)(paths[0])(strokes[0]);
endglyph;
