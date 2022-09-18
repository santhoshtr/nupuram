input glyph;
beginglyph;

z0 = (0, y1 + m/2);
z1=(x0 + mw/3, 0);
z2=(x1 + mw/3, y0);

paths[0] = z0{down}..{right}z1..{up}z2;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
clearxy;
z0 =(xpart(point 1 of paths[0]), y1 + m/2);
z1 =(x0, m*.2);
paths[1] = z0..z1;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[1])(strokes[1]);
endglyph;
