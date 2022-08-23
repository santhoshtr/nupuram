input glyph;
beginglyph;
z0=(Xw/3, X);
z1=(x0, y0- .5X);
z2=(x1 - thick/4, y1- .5X);
z3 = (x0 - Xw/3, y0-thick/4) ;
z4 = (x0 + Xw/3, y3) ;
paths[0] = z0{dir -95}..z1..{dir -100}z2;
paths[1] = z3{dir 10}..{dir -10}z4;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
