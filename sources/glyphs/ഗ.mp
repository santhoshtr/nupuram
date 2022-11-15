input glyph;
beginglyph;
z0 =(x1 + mw/6,m);
z1= (0, y0 - m/2);
z2= (x1 + mw/4, thick/2);
z3 = (x2 + mw/4, y1);
z4 = (x3 + mw/2, y0);
z5 = (x4 + mw/3, y1);
z6 = (x5 - mw/2, 0);
paths[0] = z0..z1{down}..{right}z2{right}..z3..{dir -10}z4..{dir -100}z5..{dir 190}z6;

pen_stroke(
    nib(thicknib)(2,4)
    nib(thinnib)(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
