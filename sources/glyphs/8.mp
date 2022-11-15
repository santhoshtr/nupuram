input glyph;
beginglyph;
r = 0.95;
z0 = (Xw*r/3, 0);
z1 = (x0 + Xw*r/3, .25X);
z2 = (x0, y1 + .25X);
z3=  (x0 - Xw*r/3, y2 + .25X);
z4=  (x2, X);
z5=  (x1*0.9, y3);
z6=  (x2, y2);

paths[0] =  z2..(x3, y1)..z0  ..z1.. z2 ..z3..z4..z5..z6 ;

pen_stroke(
    nib(thinnib)(1,3,5,7)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
