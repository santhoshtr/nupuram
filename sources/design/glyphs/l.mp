input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(1u, X);
z1=(x0 - 0.5u, 0.5X);
z2=(x1, 0);
z3=(x2 + 4u, y2 );

pickup nib;

pa:= z0 ..z1..{dir 240}z2{dir 30};

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(1.25,.1) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(1.25,.1) rotated 0)(infinity) % Sharp cut
)(pa)(qa);

find_outlines(soften_path(qa, 10) )(r);

fill r1 withcolor glyphcolor;


endglyph;
end