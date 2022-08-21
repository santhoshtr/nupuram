input glyph;
beginglyph;
z0 = (0, 0.6m);
z1 = (x0 + mw/4, y0 + 0.35m);
z2 = (x1 + mw/4, y1 - 0.45m);
z3 = (x2, y2 - .35m);
z4 = (x2, y2);
z5 = (x4 + mw/4, y4 + .45m);
z6 = (x5 + mw/4, m/2);
z7 = (x6 - 0.6mw, 0);

paths[0] = z0{dir 100}..{right}z1..{down}z2 ;
paths[0] := paths[0] slanted tand(-8);
paths[0] := paths[0] shifted (-tand(-8)*m/2,0);
paths[1] = z4{up}..z5{right}..{down}z6{down}..{left}z7{left};
paths[1] := paths[1] slanted tand(8);
paths[1] := paths[1] shifted (-tand(8)*m/2,0);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
