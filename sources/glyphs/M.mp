input glyph;
beginglyph;
w := 0.6X;
z0= (u, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, y0);
z4 = (x3 + w/2, y3-0.6X);
z5 = (x4, y4);
z6 = (x4 + w/2, y0);
z7 = z6;
z8 = (x7, y2);
paths[0] = z0{dir -60}..z1..  z2 ;
paths[1] = z3{dir -45}..{dir -45}z4;
paths[2] = z5{dir 90}..{dir 45}z6;
paths[3] = z7{dir 240} .. {dir 240}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 30)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45)(0)
    nib(thinterminalnib rotated 45)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(thinterminalnib rotated 45)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated -45)(0)
    nib(terminalnib rotated 150)(infinity)
)(paths[3])(strokes[3]);

endglyph;
