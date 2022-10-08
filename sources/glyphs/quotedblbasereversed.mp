input glyph;
beginglyph;
z0 = (thick/2, m/6);
z1 = (x0 - 0.05sw, y0 - m/3);
paths[0] = z0.. {down}z1;
paths[1] := paths[0] shifted(sw/4, 0);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
