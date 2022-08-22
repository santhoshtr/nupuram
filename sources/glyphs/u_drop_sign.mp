input glyph;
beginglyph;
soften := 0;
z0=(0.2mw,  0);
z1=(x0 + 0.2mw, y0 - 0.25m);
z2=(x1 - 0.2mw, y1 - 0.25m);
z3=(x2 - 0.2mw, y2 + 0.25m);
z4=(x3 + 0.2mw, y3 + 0.25m);

paths[0] = z0..tension 1.2..z1 ..z2{left}.. z3..tension 1.2..z4 ;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(0, 1, 3, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "right", z0);

endglyph;
