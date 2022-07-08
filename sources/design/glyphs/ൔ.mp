input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(1u, 2u);
z1=(x0- 1u, y0 + 0.3m);
z2=(x0 + 1u, y1 + 0.3m);
z3=(x2 + 1.5u, y2 - 0.3m);
z4=(x1, 0);
z5=(x4, 0);
z6=(x5 + 0.75m, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.75);

pickup nib;

pa:= z0{dir 135}..z1..{right}z2..z3{dir 260}..tension 2.. {dir 240}z4{dir 30}..{dir30}z6{dir 30}..z7...{dir 60}z8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3,6)
    nib(default_nib xyscaled(1.25,.1) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,.1) rotated 120)(infinity) % Sharp cut
)(pa)(qa);




fill soften_path(qa, 10) withcolor glyphcolor;

% draw qb;
draw pa withpen finenib withcolor 0.5white;

% draw qa withpen finenib withcolor 0.5green;
% draw qb withpen finenib withcolor 0.5green;


endglyph;
end