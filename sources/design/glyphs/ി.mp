input glyph;

beginglyph;
path paths[], strokes;

z0=(-2u, ascent-1u);
z1=(x0 + 2u, y0 + 2u );
z2=(x1 + 2u, y1 - 0.2m);
z3=(x2 + 0.5u  , y2 - 0.5m);
z4=(x1 + 1u, 0);

paths[0]:= z0{up} ..z1{right}.. z2..z3.. z4;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,1,    )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2,3)
    nib(default_nib xyscaled(1,.1) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,.1) rotated 135)(infinity) % Sharp cut
)(paths[0])(strokes[0]);


endglyph;
end