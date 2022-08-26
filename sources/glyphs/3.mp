input glyph;
beginglyph;
z0=(0, X - thick/2);
z1=(x0 + .5Xw, y0);
z2=(x1, X);
z3=(x0 + Xw/6, 0.55X);
z4=(x1 + Xw/10, X/3);
z5=(x2, 0);
z6=(x0, thick);

paths[0] = z0{dir 20} ..{dir 20}z1;
paths[1] = z2{down} .. {left}z3;
paths[2] = z3{right}.. z4..z5..z6;

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
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