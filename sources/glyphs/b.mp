input glyph;
beginglyph;
z0=(x1- thick/4, X);
z1=(0, X/2);
z2=(x1  ,0);
paths[0] := z0{dir -60}..z1.. z2;
paths[1] := p_loop shifted( xpart(point 0 of paths[0]),0);
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor("top", (xpart(point 1 of paths[1]), X));
endglyph;
