input glyph;
beginglyph;

paths[1] := a_loop;
paths[0] := r_vstem xyscaled(-1, -1) shifted(xpart(point 0 of paths[1]) + xpart(point 1 of r_vstem), s);
paths[1] := paths[1] xyscaled(0.5,0.5) shifted(0,s);
paths[0] := paths[0] xyscaled(0.5,0.5) shifted(0,s);
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
