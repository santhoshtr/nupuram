input glyph;
beginglyph;
z0=(0.15s, 0.9X);
z1=(x0, s/2);
z2=(x1, s/4);
z3=(x2 + sw/4, thick/4);
paths[0] = z0...z1..z2{down}..{dir 10}z3;
%bar
z4 = (0, s);
z5 = (x2 + sw/4, y4);

paths[1] = z4{dir 10}..{dir 10}z5;
pen_stroke(
    nib(thicknib rotated 0 )(0  )
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
