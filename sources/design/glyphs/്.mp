input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0 = (0, ascent+0.2m);
z1=(x0 + 0.3m, y0-0.4m);
z2=(x1 + 0.3m, y0);


pickup nib;

pa:= z0{down}..{right}z1..{up}z2  ;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1)
    nib(default_nib xyscaled(1,.11) rotated 30)(0)
    nib(default_nib xyscaled(1,.11) rotated 30)(2)
)(pa)(qa);


fill qa   withcolor glyphcolor;
draw pa   withpen finenib withcolor 0.5white;

endglyph;
end