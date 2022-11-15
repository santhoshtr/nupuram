input glyph;
beginglyph;
z0=(0.045mw, 0.6m);
z1=(x0 + mw/2, y0 - m/4);
z2=(x1 - mw/4,  thick/2);
z3=(0, 0.5m);
z4=(x3 + mw/2, m);
z5=(x4 + mw/2.4, m/2);
z6=(x5 - mw/6, 0);
paths[0]:=z0  .. z1{down}..z2{left}..z3.. z4..{down}z5..z6;
pen_stroke(
    nib(thinnib)(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0 = (x1 + mw/8, 0.5m);
z1 = (0, 0.75m);
z2 = (x1 + mw/4, m);
z3 = (x2 + mw/4, .66m);
z4 = (x3, .45m);

paths[2] = z0.. z1..z2{dir -8}..{down}z3---z4 ;
paths[2]:= paths[2] shifted(xpart(point 5 of paths[0]) + 2thick, 0);
pen_stroke(
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

clearxy;
z0 =  point 3 of paths[2] ;
z1 = (x0 + mw/3, m);
z2 = (x1 + mw/4, m/2);
z3 = (x2 - 0.6mw, 0);

paths[3] = z0{dir 80}..z1{dir -10}..z2.. z3;

pen_stroke(
    nib(thicknib)(1)
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

endglyph;
