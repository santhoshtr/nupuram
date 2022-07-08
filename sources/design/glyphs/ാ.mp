input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(1u, 0.6m);
z1=(x0 + 0.25m, y0 + 0.3m);
z2=(x1 + 0.25m, y1 - 0.5m);
z3=(x2 - 0.3m, y2 - 0.4m);
z4=(x3 - 0.25m, y3 + 0.3m);


pickup nib;

pa:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 4 )
    nib(default_nib xyscaled(1,.1) rotated 160)(0) % Sharp cut
    nib(default_nib xyscaled(1,.1) rotated 30)(infinity) % Sharp cut
)(pa)(qa);


fill qa  withcolor glyphcolor;
draw pa  withpen finenib withcolor 0.5white;

endglyph;
end