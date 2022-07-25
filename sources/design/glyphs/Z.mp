input glyph;
beginglyph;
w := 0.75X;
z0=(0, X);
z1=(x0 + w/2, y0 - 0.05X);
z2=(x1 + w/2, y1 + 0.05X);
z3=(x2 - w/2, y2 - 0.5X);
z4=(x3 - w/2, y3 - 0.5X);
z5=(x4 + w/2, y4 + 0.05X);
z6=(x5 + w/2, y5 - 0.05X);
paths[0] = z0...z1...{dir 20}z2;
paths[1] = z2{dir 225}...z3...{dir 225}z4;
paths[2] = z4{dir 20}...z5...z6  ;
pen_stroke(
    nib(thicknib rotated 0 )(2,  4 )
    nib(thinnib rotated 0 )(1, 3, 5)
    nib(terminalnib rotated 110)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thicknib rotated 0 )(2,  4 )
    nib(thinnib rotated 0 )(1, 3, 5)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[2])(strokes[2]);

endglyph;
