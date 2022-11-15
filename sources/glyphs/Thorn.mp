input glyph;
beginglyph;

z0= (0, X);
z1=(0,  X/2);
z2=(x0 , 0);

paths[0] = z0..z1..z2;
clearxy;
z0= (0, 0.8X);
z1=(X/2, (y0+y2)/2);
z2=(x0 , X-y0);

paths[1] := z0{right}..z1..{left}z2;

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
