input glyph;
beginglyph;

z0=(x1 +  thick/4, ascent);
z1=(sw/3, y0-X/2);
z2=(x0, 0);
paths[0] := z0{dir -110}..z1.. {dir -100}z2;
paths[1] :=  paths[0] shifted(sw/3,0);
clearxy;
z0=point 1 of paths[0];
z1=(0, ypart(point 0.5 of paths[0]));
z2=point 0 of paths[0];

paths[2] := z0{left}..z1.. {right}z2..point 0.06 of paths[1];
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
