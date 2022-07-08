input glyph;

beginglyph;
path pa, pb, qa, qb, r;

z0=(2u, -1u);
z1=(x0-1.5u, 0.4m);
z2=(x0+1u, y1 + 0.4m);
z3=(x2+2u, y2-m*0.4);
z4=(x2, 0);
z5=(x4 , 0);
z6=(x5 + 0.6m, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.5);

pickup nib;

pa:= z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
pb := z5{dir 30}..{dir 30}z6{dir 30}..z7...{dir 60}z8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(1.25,.1) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,.1) rotated 120)(7) % Sharp cut
)(pa)(qa);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, 1.6) rotated 0 )(2)
    nib(default_nib xyscaled(1,.1) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(1.25,.1) rotated 170)(infinity) % Sharp cut
)(pb)(qb);

find_outlines(soften_path(qa, 10), soften_path(qb,10))(r);

fill r1 withcolor glyphcolor;

% draw qb;
draw pa withpen finenib withcolor 0.5white;
draw pb withpen finenib withcolor 0.5white;
% draw qa withpen finenib withcolor 0.5green;
% draw qb withpen finenib withcolor 0.5green;


endglyph;
end