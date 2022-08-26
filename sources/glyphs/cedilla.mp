input glyph;
beginglyph;
z0 = (sw/3, 0);
z1 = (x0 , y0 - m/4 - thick/2);

z2 = (x1-thick/2 , y1 + thick/2);
z3 = (x2 + sw/3, y2 - m/4);
z4 = (x2, y3 - m/4);

paths[0] = z0 -- z1;
paths[1] = z2{right}   ..z3.. z4;

paths[0] := paths[0] crotated -20;


pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "bottom", (xpart(point 0 of paths[0]), 0) );
endglyph;
