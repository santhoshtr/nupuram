input glyph;
beginglyph;
w := s;
z0= (thick/2, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, y0 - 0.05X);
z4 = (x3 + Xw/phi, y3);
z5 = (x0, y1);
z6 = (x5 +  Xw/2, y5);


paths[0] = z0{dir -80} ..z1..{dir -80}z2; ;
paths[1] = z3{dir 10}..{dir 10}z4;
paths[2] = z5{dir 10}..{dir 10}z6;
z7 = (xpart(point 2 of paths[0]), thick/2);
z8 = (x4, y7);
paths[3] = z7{dir 10}..{dir 10}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[3])(strokes[3]);
endglyph;
