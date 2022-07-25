input glyph;
beginglyph;
w := s;
z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, y0 - 0.05X);
z4 = (x3 + w, y3);
z5 = (x0, y1);
z6 = (x5 + 0.8w, y5);

paths[0] = z0{dir -60}..z1..z2 ;
paths[1] = z3{dir 10}..{dir 10}z4;
paths[2] = z5{dir 10}..{dir 10}z6;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 90)(0,3)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated 90)(0,3)
    nib(terminalnib rotated 90)(infinity)
)(paths[2])(strokes[2]);

endglyph;
