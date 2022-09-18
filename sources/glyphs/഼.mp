input glyph;
beginglyph;

z0=(0, m*1.2);
z1=((x2+x0)/2, y0 + m/6);
z2=(x1 + mw/6, y0);
z3=(x1, y2 - m/6);
z4=(x0, y0);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[0] := paths[0] shifted (-x1, 0);
rbearing:= -x1 - thick;

pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
