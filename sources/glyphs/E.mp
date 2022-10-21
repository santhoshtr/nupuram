input glyph;
beginglyph;

z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, y0 - 0.05X);
z4 = (x3 + Xw/1.6, y3);
z5 = (x0, y1);
z6 = (x5 +  Xw/2, y5);


paths[0] = z0{dir -90} ..z1..{dir -90}z2; ;
paths[1] = z3{dir 10}..{dir 10}z4;
paths[2] = z5{dir 10}..{dir 10}z6;
z7 = (xpart(point 2 of paths[0]), thick/2);
z8 = (x4, y7);
paths[3] = z7{dir 10}..{dir 10}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
anchor( "top", (xpart(point 0.5 of paths[1]), 1.2X) );
endglyph;
