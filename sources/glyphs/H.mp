input glyph;
beginglyph;

z0=(1u, X);
z1=(x0, y0 - (phi-1)*X);
z2=(x1, 0);
z3=(x0 + 0.5X, X);
z4=(x3, y3 - (phi-1)*X);
z5=(x4, 0);


paths[0] = z0{dir -80} ..z1..{dir -80}z2;
paths[1] = z3{dir -80} ..z4..{dir -80}z5;
z6 = point 0.8 of paths[0];
z7 = point 0.8 of paths[1];
paths[2]:= z6..z7;
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
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);

endglyph;
