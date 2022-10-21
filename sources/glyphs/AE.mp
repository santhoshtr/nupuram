input glyph;
beginglyph;
% Left slant
z0= (0, 0);
z1 = (x0 + (x2 - x0)/2 - thick/2, X/2);
z2= (x1 + 0.25Xw, X );
paths[0] = z0 .. {dir 70}z1 .. {dir 55}z2;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
% bar
z0 = point 0.8 of paths[0] ;
z1 = (xpart(point 2 of paths[0]), y0) ;
paths[1]:= z0 .. z1 ;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
% E
clearxy;
z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);

paths[2] = z0{dir -90} ..z1..{dir -90}z2; ;
paths[2] := paths[2] shifted(xpart(point 2 of paths[0]), 0);
z3 = (xpart(point 0 of paths[2]), ypart(point 0 of paths[2]) - 0.05X);
z4 = (x3 + Xw/1.6, y3);
z5 = (x3, y1);
z6 = (x5 +  Xw/2, y5);
paths[3] = z3{dir 10}..{dir 10}z4;
paths[4] = z5{dir 10}..{dir 10}z6;
z7 = (xpart(point 2 of paths[2]), thick/2);
z8 = (x4, y7);
paths[5] = z7{dir 10}..{dir 10}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[4])(0)
    nib(terminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[5])(0)
    nib(terminalnib rotated terminalangle infinity of paths[5])(infinity)
)(paths[5])(strokes[5]);

endglyph;
