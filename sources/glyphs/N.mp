input glyph;
beginglyph;
w := 0.6X;
z0= (u, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, y0);
z4 = (x3 + w/2, y1);
z5 = (x3 + w, y2);
z6 = z5;
z7 = (x6, y0);
paths[0] = z0{dir -60}..z1..  z2 ;
paths[1] = z3{dir -45}..z4..{dir -45}z5;
paths[2] = z6{dir 120}..{dir 120}z7;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 45)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 45)(infinity)
)(paths[2])(strokes[2]);
endglyph;
