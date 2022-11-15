input glyph;
beginglyph;

paths[0] := r_vstem;
paths[1] := subpath(0.25, 3) of n_arch shifted(xpart(point 1 of r_vstem),0);

pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(1,3)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0=point infinity of paths[1];
z1=(x0-s/3, -descent);
paths[2]=z0{dir -95} ..{left}z1;
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
