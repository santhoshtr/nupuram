input glyph;
beginglyph;
w := 0.7s;
z0= (x1 + thick/4, s);
z1=( 0, y0 - 0.5s);
z2=( x0, 0);
z3=( x2 - s/5, y2 - s/3);
z4=( x3 - s/5, y3 + s/3);

paths[0] = z0{dir -110}..  z1..  z2..z3{left}..{dir 80}z4;
paths[1] = fullcircle scaled (thick*1.2) shifted(x0, 1.33s);
strokes[1] = paths[1];
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
