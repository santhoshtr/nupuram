input glyph;
beginglyph;
z0=(0, X );
z1=(x0 + .67Xw, X);
z2=(x0, 0);
z3=(x1, 0);


paths[0] = z0{dir -20}..{dir 20}z1;
paths[1] = z1{dir -110}..{dir 260}z2;
paths[2] = z2{dir 20}..{dir -20}z3 ;
pen_stroke(
    nib(terminalnib rotated 60)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[2])(strokes[2]);

endglyph;
