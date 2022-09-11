input glyph;
beginglyph;

z0=(x1 - thick/2, X);
z1=(thick/2,  (y0+y2)/2);
z2=(x1, -descent*1.2);

paths[0] := z0{dir -60}..{down}z1{down}..{dir -85}z2;
paths[1] := p_loop shifted ( xpart(point 1 of paths[0]), 0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
