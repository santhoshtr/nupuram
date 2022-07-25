input glyph;
beginglyph;
path paths[], strokes;
z0=(1u, X);
z1=(x0, y0- .5X);
z2=(x1, y1- .5X);
z3=(x0+0.5X, X);
z4=(x3, y3 - .5X);
z5=(x4, y4 - .5X);
z6 = (x1 - 0.1Xw, y1 - u/3) ;
z7 = (x6 + 0.6Xw, y6 ) ;
paths[0] = z0{dir -80} ..z1..z2;
paths[1] = z3{dir -80}..z4..z5;
paths[2]:= z6{dir 20}..{dir 20}z7;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 120)(0)
    nib(thinterminalnib rotated 120)(infinity)
)(paths[2])(strokes[2]);

endglyph;
