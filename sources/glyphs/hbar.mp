input glyph;
beginglyph;


z0=(x1, X);
z1=(0,  y0 - X/2);
z2=(x1, 0);

paths[0] = z0{dir -60}..z1..  {dir -85}z2 ;
paths[0]:= paths[0] shifted(sw/4, 0);
paths[1] := subpath(0.25, 4) of n_arch shifted(xpart(point 0 of paths[0]),0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

% bar
clearxy;
z0=(0, ypart(point 0.75 of paths[0]));
z1=(x0+sw/2, y0 + s/4);
paths[2]=z0..z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
