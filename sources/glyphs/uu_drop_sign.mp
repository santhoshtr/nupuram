input glyph;
beginglyph;
soften := 0;
z0=(0.2mw,  0);
z1=(x0 + 0.2mw, y0 - 0.2m);
z2=(x1 - 0.2mw, y1 - 0.2m);
z3=(x2 - 0.2mw, y2 + 0.2m);
z4=(x3 + 0.2mw, y3 + 0.2m);
z5=(x4 + 0.4mw, y4 - 0.3m);
z6=(x5 - 0.45mw, y5 - 0.3m);

paths[0] = z0{right} .. z1 ..z2{left}..z3.. z4..z5..z6 ;
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(0, 1, 3, 4, 5)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

anchor( "right", z0);

endglyph;
