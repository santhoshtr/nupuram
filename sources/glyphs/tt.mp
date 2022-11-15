input glyph;
beginglyph;
z0=(sw/6, 0.95X);
z1=(x0 , 0.6s);
z2=(x1 + sw/4, 0);
z3=(x2 + sw/4, s/4);
paths[0] = z0{dir -80}..z1{dir -95}..z2{right}..{dir 75}z3;

% bar
z4 = (x0-0.25sw,s);
z5 = (x4 + sw*1.3,y4);

paths[1] := paths[0] shifted(xpart(point 3 of paths[0]), 0);
paths[2] = z4{dir 10}.. z5;

pen_stroke(
    nib(thicknib)(0)
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib)(0)
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
