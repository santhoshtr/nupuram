input glyph;
beginglyph;
paths[0] := pa_mouth;
paths[1] := pa_tail shifted(xpart(point infinity of paths[0]), 0);

pen_stroke(
    nib(thicknib)(0, 2, 4, 5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib)(1, 3)
    nib(thinnib)(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


% Ra
clearxy;
z0=(0, 0);
z1=(x0- mw/4, m/2);
z2=(x0 + mw/3, y1 + m/2);
z3=(x2 + mw/3, y2-m/2);
z4=(x2, 0);
paths[2] = z0{dir 135} ..z1..{right}z2..z3{dir 260} ..z4;
paths[2] := paths[2] shifted (mw/4, -1.1m ) xscaled 0.66 yscaled 0.66;
paths[3] := paths[2] shifted (0.8mw, 0);

pen_stroke(
    nib(thicknib)(0, 2,5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

pen_stroke(
    nib(thicknib)(0, 2,5, 6)
    nib(thinnib)(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

rbearing:=0;
endglyph;
