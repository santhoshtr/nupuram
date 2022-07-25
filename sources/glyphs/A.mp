input glyph;
beginglyph;
path paths[], strokes;
z0=(0, 0);
z1=(x0+0.1X, y0 + .5X);
z2=(x1+0.2Xw, y1 + .5X);
z3=(x2, y2);
z4=(x3 + 0.2Xw, y3 - .5X);
z5=(x4 + 0.1Xw, y4 - .5X);
z6 = (x1 - 0.2Xw, y1 - u) ;
z7 = (x6 + 0.3Xw, y6 + u/2) ;
z8 = (x7 + 0.3Xw, y7  ) ;
paths[0] = z0{dir 80} ..z1..z2;
paths[1] = z3{dir -80}..z4..z5;
paths[2]:= z6{dir 20}..z7.. z8;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated -20)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated -20)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[2])(strokes[2]);

endglyph;
