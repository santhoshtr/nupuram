input glyph;
beginglyph;
save r;
r=0.8;
z0 = (0, s/2);
z1 = (x0 + r*sw/2, s - thick/4);
z2 = (x1 + r*sw/2, y0);
z3 = (x2 - r*sw/2, thick/4);
paths[0]:= z0{dir 86}..z1{dir 4}..z2{dir 266}..z3{dir 184}..{dir 86}z0;

pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(0,2, 4)
)(paths[0])(strokes[0]);
clearxy;
z0= (xpart(point 2 of paths[0]), X*0.8);
z1=(xpart(point 1 of paths[0]), (y0+y2)/2);
z2=(xpart(point 0 of paths[0]), -X*0.05);

paths[1] = z0{dir 260}..z1..{dir 260}z2 ;

pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
