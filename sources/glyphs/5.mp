input glyph;
beginglyph;
z0=(0.1Xw , X - 0.05X);
z1=(x0 + .55Xw, y0);
z3=(0.05Xw, 0.5X);
z4=(x0 + Xw/2, X/3);
z5=(0, 0.1X);

paths[0] = z0  ..{dir 20}z1;
paths[1] = z0{dir -120}  ..  {dir -90}z3{dir 45}.. z4..{dir 150}z5;

pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;