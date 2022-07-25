input glyph;
beginglyph;
soften := 0;
z0=(0.2mw,  0);
z1=(x0 + 0.2mw, y0 - 0.25m);
z2=(x1 - 0.2mw, y1 - 0.25m);
z3=(x2 - 0.2mw, y2 + 0.25m);
z4=(x3 + 0.2mw, y3 + 0.25m);
z5=(x4 + 0.3mw, y4 - 0.25m);
z6=(x5 + 0.3mw, y5 - 0.25m);
z7=(x6 + 0.2mw, y6 + 0.25m);
z8=(x7 - 0.2mw, y7 + 0.25m);
paths[0] = z0...z1{down}...z2{left}..{up}z3..z4..z5..z6..z7..z8 ;
pen_stroke(
    nib(thicknib rotated 0 )(2,4 )
    nib(thinnib rotated 0 )(0, 1, 3,   5, 7)
    nib(terminalnib rotated 45 )(infinity)
)(paths[0])(strokes[0]);

endglyph;