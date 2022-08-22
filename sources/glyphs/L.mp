input glyph;
beginglyph;
paths[0] =  l_vstem ;
z3=(xpart(point 2 of l_vstem), thick*thin/2);
z4=(x3 + Xw/2, y3);

paths[1] = z3{dir 10}..{dir 10}z4;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 3, 5 )
    nib(thinnib rotated 0 )(1,2 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
