input glyph;

beginglyph;

    z0=(0.3m, 0);
    z1=(x0 - 0.3m, y0 + 0.5m);
    z2=(x1 + 0.5m, y1 + 0.5m);
    z3=(x2 + 0.5m, y2 - 0.5m);
    z4=(x3 - 0.3m, y3 - 0.5m);
    z5=(x4 - 0.3m, y4 + 0.5m);
    z6=(x5 + 0.2m, y5 + 0.5m);
    z7=(x5-0.2m , y6 + 0.3m);

    paths[0]:= z0..z1..z2..z3..z4..z5..z6{up}..{left}z7;

    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 6)
        nib(default_nib xyscaled(xthick,.11) rotated 45)(0)
        nib(default_nib xyscaled(xthick,.11) rotated 90)(infinity)
    )(paths[0])(strokes[0]);

endglyph;
end