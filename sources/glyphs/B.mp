input glyph;
beginglyph;
w := 0.6s;
z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, X - 0.1X);
z4 = (x3 + w, y0);
z5 = (x4 + w/3, y4 - 0.2X );
z6 = (x3, y5 - 0.3X );
z7 = (x6 + 1.5w, y6 - 0.3X );
z8 = (x7 - 0.7w, y7 - 0.2X );
z9 = (x2, 0.05X );
paths[0] = l_vstem ;
paths[1] = z3{dir 45}..z4..z5..{left}z6{right}..z7..z8..{dir 170}z9;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 3 of paths[1])(3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
