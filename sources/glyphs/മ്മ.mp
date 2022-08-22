input glyph;
beginglyph;
z0=(mw/4 + thick/2,  m/3);
z1=(x0 - mw/4, y0 + m/3);
z2=(x1 + mw/2.5, y1 + m/3);
z3=(x2 + mw/2.5, y2 - 0.35m);
z4=(x1, 0);

z5=(x4, 0);
z6=(x3, y5);
z7=(x6, y6 + 0.2m);
z8=(x3, y7 + m/3);

paths[0] = z0..z1{up}..{right}z2{right}..z3{down}.. {dir 240}z4;
paths[1] = z5{dir 20}..{dir 20}z6 ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3,6)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0, 4, 5 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

paths[2] := paths[0] shifted (.8mw,0);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5 )
    nib(thinnib rotated 0 )(1,3,6)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

paths[3] = z5{dir 20}..{dir 20}z6{dir 20}..z7..z8;
paths[3]:= paths[3] shifted (0.8mw,0);

pen_stroke(
    nib(thicknib rotated 0 )(0, 4, 5 )
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
endglyph;
