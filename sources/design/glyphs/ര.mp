input glyph;

beginglyph;
    path pa,pb, qa, qb, r;
    z0=(0.3m, -0.1m); % bottom of piller
    z1=(x0 - 0.3m, y0 + 0.6m);
    z2=(x1 + 0.5m, y1 + 0.5m); % Top of second arch
    z3=(x2 + 0.5m, y2 - 0.5m);
    z4=(x3 - 0.3m, y3 - 0.5m);
    z5=(x4 - 0.3m, y4 + 0.5m);
    z6=(x5 + 0.2m, y5 + 0.3m);


    pickup nib;

    pa:= z0..z1..z2..z3..z4..z5...z6 ;

    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 6)
        nib(default_nib xyscaled(1,.11) rotated 45)(0)
        nib(default_nib xyscaled(1,.11) rotated 135)(infinity)
    )(pa)(qa);

    fill soften_path(qa, 10) withcolor glyphcolor;
    draw pa withpen finenib withcolor 0.5white;




endglyph;
end