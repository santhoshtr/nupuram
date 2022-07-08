input glyph;

beginglyph;
    path pa,pb, qa, qb, r;
    z0=(2.5u, 0);
    z1=(x0 -2u, y0  + 0.5m);
    z2=(x1 + 1.5u, y1 + 0.4m);
    z3=(x2 + 2u, y2 - m*0.5);
    z4=(x3, 1u); % bottom of piller
    z5=(x3, y3);
    z6=(x5 + 2.5u, y5 + 0.6m); % Top of second arch
    z7=(x6 + 2u, y6 - 0.5m);
    z8=(x7 - 2u, 0);

    pickup nib;

    pa:= z0..z1..{right}z2.. z3---z4 ;
    pb:= z4---z5..z6..z7..z8;

    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
        nib(default_nib xyscaled(1,.11) rotated 45)(0)
        nib(default_nib xyscaled(1,.11) rotated 10)(4 )
    )(pa)(qa);
    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 6)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 7)
        nib(default_nib xyscaled(1,.11) rotated 0)(0)
        nib(default_nib xyscaled(1,.11) rotated 135)(infinity)
    )(pb)(qb);

    find_outlines(soften_path(qa, 10),soften_path(qb, 10) )(r);

    fill r1 withcolor glyphcolor;
    draw pa withpen finenib withcolor 0.5white;
    draw pb withpen finenib withcolor 0.5white;





endglyph;
end