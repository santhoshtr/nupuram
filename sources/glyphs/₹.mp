input glyph;
beginglyph;
z0 = (mw/4, X );
z1 = (x0 + mw/3, y0 - X/4);
z2 = (x1 - mw/2, 0.45X);
z3 = (x2 + mw/3, X/4);
z4 = (x3 + mw/3, 0);


paths[0] = z0{right}..z1{dir -100}..{left}z2{dir -30}.. z3 ..  {dir -30}z4;

z5 = (0, y0);
z6 = (x4,y0);
paths[1] = z5--z6;
z7 = (0, y1);
z8 = (x4,y1);
paths[2] = z7--z8;

pen_stroke(
    nib(thicknib)(0,2,4)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated 90)(2)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;