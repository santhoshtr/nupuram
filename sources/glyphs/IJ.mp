input glyph;
beginglyph;
z0=(thick/2, X);
z1=(x0,y0 - X/2);
z2=(x1, 0);

paths[0] = z0{dir -90}..z1..  {dir -90}z2  ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

% J

clearxy;
z0= (x1 + thick/2, X);
z1=( xpart(point 0 of paths[0]) + Xw/2 , X/3);
z2=( x1 - Xw/5, 0);
z3=( x2 - Xw/6, y2 + X/4);

z5 = (x3, y0 );
z6 = (x0 , y0);

paths[1] = z0{dir -120}..  z1{down}..z2{left}..{dir 80}z3;
paths[2] = z5 ..{dir -10} z6;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
