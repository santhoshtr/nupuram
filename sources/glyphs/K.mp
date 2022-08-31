input glyph;
beginglyph;
z0=(0, X);
z1=(x0, y0- .5X);
z2=(x1, 0);

paths[0] = z0{down}..z1..{down}z2;

clearxy;
z0= (xpart(point 1 of paths[0]), X/3);
z1= ( x0 + Xw/2, X);

paths[1] = z0..{dir 45}z1;
z2 = point .3 of paths[1];
z3 = (x1 + thick/2, 0);

paths[2] = z2..{dir -45}z3;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
