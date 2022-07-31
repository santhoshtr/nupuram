input glyph;
beginglyph;
z0= (thick/2, X);
z1=( x0, y0 - (phi-1)*X);
z2=( x1, 0);
z3 = (x0, y0);
z4 = (x3 + (phi-1)*X/2 , y1);
z5 = (x4, y4);
z6 = (x4 +(phi-1)*X/2 , y0);
z7 = (x6, y1);
z8 = (x7, y2);

paths[0] = z0{dir -80}..z1..  {dir -80}z2 ;
paths[1] = z3{dir -45}..{dir -45}z4;
paths[2] = z5{dir 45}..{dir 45}z6;
paths[3] = z6{dir 260}..z7 .. {dir 260}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 45)(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 135)(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated -45)(0)
    nib(terminalnib rotated 0)(infinity)
)(paths[3])(strokes[3]);

endglyph;
