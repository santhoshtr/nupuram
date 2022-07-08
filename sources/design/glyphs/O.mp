input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(0, 0.5X);
z1=(x0 + 0.4X, y0 + 0.5X);
z2=(x1 + 0.4X, y1 - 0.5X);
z3=(x2 - 0.4X, y2 - 0.5X);
z4=(x3 - 0.4X, y3 + 0.5X);

pickup nib;

pa:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2, 4)
)(pa)(qa);


fill qa withcolor glyphcolor;


endglyph;
end