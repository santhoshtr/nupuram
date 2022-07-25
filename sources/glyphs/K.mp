input glyph;
beginglyph;
w := 0.7X;
z0= (u, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0 + 0.75w, X);
z4 = (x1, y3 - 0.6X);
z5 = z4;
z6 = (x5 + 0.8w, y5 - 0.4X);
paths[0] = z0{dir -60}..z1..  z2 ;
paths[1] = z3{dir 240}..{dir 240}z4;
paths[2] = z5{dir -30}..{dir -30}z6;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 90)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 90)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[2])(strokes[2]);
endglyph;
