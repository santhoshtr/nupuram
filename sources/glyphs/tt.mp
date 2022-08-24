input glyph;
beginglyph;
z0=(sw/6, 0.9X);
z1=(x0 + thick/4, s/3);
z2=(x1 + thick/4, thick/2);
z3=(x2 + 0.4sw, s/4);
paths[0] = z0{dir -60}...z1{down}..z2{dir -60}..{dir 60}z3;

% bar
z4 = (x0-0.25sw,s);
z5 = (x4 + sw*1.2,y4);

paths[1] := paths[0] shifted(xpart(point 3 of paths[0]), 0);
paths[2] = z4{dir 10}.. z5;

pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0 )
    nib(thinnib rotated 0 )(1,2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
