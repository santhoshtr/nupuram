input glyph;
beginglyph;
z0= (0.05sw, X);
z1=(0,  X/2);
z2=(x0 + 0.05sw, 0);

paths[0] = z0..z1{down}..{dir -60}z2;
paths[0] := paths[0] shifted (sw/4,0);
pen_stroke(

    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

% Slash
clearxy;
z0=(0, ypart(point 1 of paths[0]));
z1=(x0+sw/2, y0 +s/4);
paths[1]=z0..z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
