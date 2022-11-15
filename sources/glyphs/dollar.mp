input glyph;
beginglyph;
z0 = (0, .1X);
z1 = (x0 + Xw/3, y0 - .1X);
z2 = (x1 + Xw/3, y1 + .2X);
z3 = (x1, y2 + .35X);
z4=  (x0, y3 + .25X);
z5=  (x1, X);
z6=  (x5 + .25Xw, y5 - .1X);

paths[0] = z0{dir -30}..z1..z2..{dir 160}z3..z4..z5..{dir -30}z6 ;

z7 = (x1, 1.2X);
z8 = z3;
z9 = (x7, -.2X);
paths[1] = z7{dir -80}..z8..{dir -80}z9 ;

pen_stroke(
    nib(thicknib)(0,1, 3)
    nib(thinnib)(2, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
