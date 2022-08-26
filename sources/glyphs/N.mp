input glyph;
beginglyph;
z0= (thick/2, X);
z1=( x0, X/2);
z2=( x1, 0);
z3 = (x0, y0);
z4 = (x3 + 0.66*X/2, y1);
z5 = (x4 + 0.66*X/2, y2);
z6 = z5;
z7 = (x6, y1);
z8 = (x6, y0);
paths[0] = z0{dir -80}..z1.. {dir -80} z2 ;
paths[1] = z3{dir -70} .. z4..  {dir -70}z5;
paths[2] = z6{dir 100}..z7..{dir 100}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "top", (xpart(point 1 of paths[1]), 1.2X) );
endglyph;
