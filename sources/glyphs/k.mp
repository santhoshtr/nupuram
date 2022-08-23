input glyph;
beginglyph;

paths[0] = l_vstem ;
z0= (xpart(point 1 of l_vstem), s/3);
z1= ( x0 + 0.66*sw, s);

paths[1] = z0 .. {dir 60}z1;
z2 = point .3 of paths[1];
z3 = (x1 + thick/2, 0);

paths[2] = z2 .. {dir -30}z3;

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
