input glyph;
beginglyph;

z0 = (0, y1 + m/3);
z1=(x0 + mw/3, m);
z2=(x1 + mw/3, y0);

paths[0] = z0{down}..{right}z1..{up}z2;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
clearxy;
soften:=0;
paths[1] = fullcircle scaled (thick*1.5)  shifted(mw/3, m*1.25);
strokes[1] = paths[1];
endglyph;
