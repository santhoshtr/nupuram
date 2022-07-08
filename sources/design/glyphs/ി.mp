input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(0, ascent-1u);
z1=(x0 + 1.5u, y0 + 2u );
z2=(x1 + 1.5u, y1 - 0.2m);
z3=(x2+0.5u  , y2 - 0.5m);
z4=(x1 + 1u, 0);

pickup nib;

pa:= z0{up} ..z1{right}.. z2..z3.. z4;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,1,    )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2,3)
    nib(default_nib xyscaled(1,.1) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(1,.1) rotated 135)(infinity) % Sharp cut
)(pa)(qa);


find_outlines(soften_path(qa, 10))(r);
fill r1 withcolor glyphcolor;
draw pa withpen finenib withcolor 0.5white;

endglyph;
end