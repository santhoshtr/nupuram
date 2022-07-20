input glyph;
beginglyph;
    z0=(0.3m + .5thick, 0);
    z1=(x0 - mw/3, y0 + m/2);
    z2=(x1 + mw/2, y1 + m/2);
    z3=(x2 + mw/2, y2 - m/2);
    z4=(x3 - mw/4, y3 - m/2);
    z5=(x4 - mw/4, y4 + m/2);
    z6=(x5 + 0.2mw, y5 + m/2);
    z7=(x5 - m/4, y6 + 0.3m);
    paths[0] = z0..z1..z2..z3..z4..z5..z6{up}..{left}z7;
    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 6)
        nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0)
        nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity)
    )(paths[0])(strokes[0]);
endglyph;
