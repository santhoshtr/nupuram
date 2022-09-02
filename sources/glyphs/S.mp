input glyph;
beginglyph;

r = 0.66;
z0 = (0, 0.15X);
z1 = (x0 + Xw*r, .25X);
z2 = ((x0 + x1)/2, y1 + .25X);
z3=  (x0 + thick/4, y2 + .25X);
z4=  (x1 - thick/4, 0.9X);

paths[0] = z0{dir -40}  ..z1.. z2 ..z3..{dir -45}z4 ;

pen_stroke(
    nib(thinnib rotated 0 )(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "top", (xpart(point 2 of paths[0]), 1.2X) );
anchor( "bottom", (xpart(point 2 of paths[0]), 0) );
endglyph;
