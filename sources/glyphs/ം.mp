input glyph;
beginglyph;

soften := 0;
z0=(0, m/3);
z1=(x0 + mw/4, y0 + m/3);
z2=(x1 + mw/4, y1 - m/3);
z3=(x2 - mw/4, y2 - m/3);
z4=(x3 - mw/4, y3 + m/3);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[0] := paths[0] slanted tand(4);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);

endglyph;
