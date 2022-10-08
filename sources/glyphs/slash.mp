input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
z0= (X/2, X);
z1=( X/4, y0 - 0.6X);
z2=( 0, y1 - 0.6X);

paths[0] = z0{dir 255}..z1..{dir 255}z2 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
