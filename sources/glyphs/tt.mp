input glyph;
beginglyph;
z0=(0.15s, X);
z1=(x0, X/2);
z2=(x1, thick);
z3=(x2 + sw/4, 0);

% bar
z4 = (x0-0.25sw,s);
z5 = (x4 + sw,y4);
paths[0] = z0...z1..z2{down}..{dir 10}z3;
paths[1] := paths[0] shifted(sw/2, 0);
paths[2] = z4{dir 10}..{dir 10}z5;

pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
