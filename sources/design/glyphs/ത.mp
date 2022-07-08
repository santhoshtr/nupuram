input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(.25m, -0.5u);
z1=(x0 - .25m, y0 + 0.5m);
z2=(x1 + .4m, y1 + 0.45m);
z3=(x2 + .4m, y2 - 0.5m);
z4=(x3 - .2m ,  y3 - 0.3m);
z5=(x4 - .2m , y4 +  0.35m);
z6=(x5 + .4m , y5 +  0.5m);
z7=(x6 + .4m , y6 -  0.5m);
z8=(x7 - .25m , y7 -  0.5m);

pickup nib;

pa:= z0{dir 135}..z1..{right}z2{right}..{down}z3{down}..{left}z4..{up}z5..z6..z7..z8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4,6, )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5, 7)
    nib(default_nib xyscaled(1,.1) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,.1) rotated 135)(infinity) % Sharp cut
)(pa)(qa);


r := soften_path(qa, 10);
fill r withcolor glyphcolor;
draw pa withpen finenib withcolor 0.5white;

endglyph;
end