input glyph;
beginglyph;
z0=(Xw/15, X - Xw/5);
z1=(x0 + .55Xw, 0.8X);
z2=(x0 + Xw/5, 0.55X);

paths[0] = z0{dir 45} ..z1{down}..{left}z2;

z3=(x2, y2);
z4=(x1 + Xw/10, X/4);
z5=(0, Xw/5);

paths[1] = z3{right}.. z4..{dir 135}z5;

pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;