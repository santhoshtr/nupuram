input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.1X);
z3=( x2, y2 - 0.5X);

paths[0] = z0..z1;
paths[1] = z2..z3 ;

pen_stroke(

    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)     nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


endglyph;
