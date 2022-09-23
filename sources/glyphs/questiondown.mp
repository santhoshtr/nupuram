input glyph;
beginglyph;
z0 = (x3, y1 + m/3);
z1 = (x0, y2+m/3);
z2 = (0, y4);
z3 = (x2 + mw/4, -m/4);
z4 = (x3 + mw/3, y3 + m/4);

paths[0] := z0 ..  z1..z2.. z3.. z4;
soften:=0;
paths[1] = fullcircle scaled (thick*1.5)  shifted(x1, m);

pen_stroke(
    nib(thicknib rotated 0 )(1 )
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
strokes[1] = paths[1];

endglyph;