input glyph;
beginglyph;
z0 = (0.5sw, s/2 );
z1 = (x0 - 0.5sw, y0 + s/3);
z2 = (x0 - 0.5sw, y0 - s/3);
paths[0] = z0--z1;
paths[1] = z0--z2;

pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
paths[2] := paths[0] shifted(s/2, 0);
paths[3] := paths[1] shifted(s/2, 0);;
strokes[2] := strokes[0] shifted(s/2, 0);
strokes[3] := strokes[1] shifted(s/2, 0);;
endglyph;
