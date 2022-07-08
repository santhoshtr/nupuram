input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(1u, 0.5m);
z1=(x0 + 0.4m, y0 + 0.5m);
z2=(x1 + 0.4m, y1 - 0.5m);
z3=(x2 - 0.4m, y2 - 0.5m);
z4=(x3 - 0.4m, y3 + 0.5m);

pickup nib;

pa:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2, 4)
)(pa)(qa);


fill qa crotated -18 withcolor glyphcolor;
draw pa crotated -18 withpen finenib withcolor 0.5white;

endglyph;
end