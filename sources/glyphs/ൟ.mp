input glyph;
beginglyph;

z0=(0, 0.4m);
z1=((x2+x0)/2, y0 + 0.25m);
z2=(x1 + 0.25mw, y0);
z3=(x1, y2 - 0.25m);
z4=(x0, y0);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[0] := paths[0] slanted tand(4) shifted(-tand(4)*m/2,0);

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);

clearxy;
z0=(x1 + 0.3mw, 0);
z1=(xpart(point 2 of paths[0]) + mw/4, y0 + 0.5m);
z2=(x1 + 0.5mw, y1 + 0.5m);
z3=(x2 + 0.5mw, y2 - 0.5m);
z4=(x3 - 0.3mw, y3 - 0.5m);
z5=(x4 - mw/4, y4 + m/3);

paths[1] = z0..z1..z2..z3..z4..{dir 80}z5;
z6 = point 2.75 of paths[1];
paths[1] := paths[1]..{right}z6 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4)
    nib(thinnib rotated 0 )(1, 3, 5, 6)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
paths[2] = paths[0] shifted (xpart(point infinity of paths[1]) + mw/3,0);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[2])(strokes[2]);
endglyph;
