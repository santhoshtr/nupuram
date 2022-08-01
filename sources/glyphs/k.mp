input glyph;
beginglyph;
w := 0.7s;
z0= (thick/2, X);
z1=( x0, y0 - (phi-1)*X);
z2=( x1, 0);

z3 = (x0, s/2);
z4 = (x3 + s/3, s - thick/4);
z5 = (x4 + s/4, 3/4s);
z6 = (x1, s/2);
z7 = z6;
z8 = (x5, 0);

paths[0] = z0{dir -80}..z1..  {dir -80}z2 ;
paths[1] = z3{dir 80}..z4..z5..{left}z6;
paths[2] = z7..{dir -30}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1 )
    nib(thinnib rotated 0 )(0,2)
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
