input glyph;
beginglyph;
z0=(0, .9X);
z1=(x0 + .67mw, X);
z2=(x1 - mw/4, 0);

paths[0] = z0{right} ..{dir 30}z1;
paths[1] = z1{dir 250}..{down}z2;

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;