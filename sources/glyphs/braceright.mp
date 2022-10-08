input glyph;
beginglyph;
z0 = (x1 - Xw/8, X );
z1 = (x2 - Xw/8, y2 + s/3);
z2 = (Xw/4, X/2);
z3 = (x2 - Xw/8, y2 - s/3);
z4 = (x0, 0);

paths[0] = z0{right}..z1{down}.. {right}z2;
paths[1] = z2{left}..z3{down}.. {left}z4;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
