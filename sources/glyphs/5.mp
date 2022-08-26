input glyph;
beginglyph;
z0=(x2 , X - thick/2);
z1=(x0 + .55Xw, y0);
z2=(x3 + thick/2, X);
z3=(thick/2, 0.5X);
z4=(x2 + Xw/2, X/3);
z5=(0, thick);

paths[0] = z0{dir 20} ..{dir 20}z1;
paths[1] = z2{dir -120}  ..  {dir -120}z3;
paths[2] = z3{dir 60}.. z4..{dir 150}z5;

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;