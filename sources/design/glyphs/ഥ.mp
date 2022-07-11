input glyph;

beginglyph;
path paths[], strokes[], r;

z0=(1u, m);
z1=(x0 - 0.5u, 0.5m);
z2=(x1, 0);
z3=(x2 + 5u, y2);
z4=(x3 + 1u, y3 + m*0.5);
z5=(x4- 2u, y4 + m*0.5);
z6=(x5 - 2u, y5 - m*0.3);
z7=(x6 + 1u, y2 + 1u);

pickup nib;

paths[0]:= z0 ..z1..{dir 240}z2{dir 30}..{dir 30}z3{dir 30}..z4{up}..{left}z5..z6..z7;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 3, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,   4, 6)
    nib(default_nib xyscaled(xthick,.1) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,.1) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

find_outlines(soften_path(strokes[0], 10) )(r);







endglyph;
end