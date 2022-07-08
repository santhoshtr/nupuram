input glyph;

beginglyph;
    path pa,pb, qa, qb, r;
    z0=(2.5u, 0);
    z1=(x0 -2u, y0  + 0.5m);
    z2=(x1 + 1.5u, y1 + 0.4m);
    z3=(x2 + 2u, y2 - m*0.5);
    z4=(x3, 1u); % bottom of piller
    z5=(x3, y3);
    z6=(x5 + 2.5u, y5 + 0.5m); % Top of second arch
    z7=(x6 + 2.5u, y6 - 0.5m);
    z8=(x7 - 2u, y7 - 0.3m);
    z9=(x8 - 1u, y8 + 0.4m);
    z10=(x9 + 1u, y9 + 0.4m);
    z11=(x3, y10 + 0.3m);

    pickup nib;

    pa:= z0..z1..{right}z2.. z3---z4 ;
    pb:= z4---z5..z6..z7..z8 .. z9..z10..{dir 215}z11;

    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
        nib(default_nib xyscaled(1,.11) rotated 45)(0)
        nib(default_nib xyscaled(1,.11) rotated 10)(4 )
    )(pa)(qa);
    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 6)
        nib(default_nib xyscaled(1,.11) rotated 0)(0)
        nib(default_nib xyscaled(1,.11) rotated 90)(infinity)
    )(pb)(qb);

    find_outlines(soften_path(qa, 10),soften_path(qb, 10) )(r);

    fill r1 withcolor glyphcolor;


endglyph;
end