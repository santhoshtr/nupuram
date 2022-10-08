input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
z0= (0, X);
z1=( x0, y0 - 0.6X);
z2=( x1, y1 - 0.6X);

paths[0] = z0{dir -80}..z1..{dir -80}z2 ;

pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
