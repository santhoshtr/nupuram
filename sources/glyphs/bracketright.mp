input glyph;
beginglyph;
z0= (X/3, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (0, y0);
z4 = (x3 + X/3, y3);
z5 = (x0, y1);
z6 = (x5 + 0.8w, y5);
z7 = (0, y2);
z8 = (x7 + X/3, y7);

paths[0] = z0{dir -90}..z1..{dir -90}z2;
paths[1] = z3{dir -10}..{dir 10}z4;
paths[2] = z7{dir -10}..{dir 10}z8;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
