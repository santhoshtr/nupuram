input glyph;
beginglyph;


z0=(x1 - thick/2, X);
z1=(0,  y0 - X/2);
z2=(x1, 0);

paths[0] = z0{dir -60}..z1..  {dir -85}z2 ;
paths[1] := subpath(0.25, 4) of n_arch shifted(xpart(point 0 of l_vstem),0);

pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(1,3)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
