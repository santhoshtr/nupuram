input glyph;

beginglyph;
path paths[], strokes[], r;

z0=(1.5u, 0.4m);
z1=(x0 + 2u, 0.75m);
z2=(x1-1.5u, y0 + 0.6m);
z3=(x2-1.5u, y0);
z4=(x3, 0);
z5=(x4 + 0.8m, y4);
z6=(x5, y5 + m*0.5);
z7=(x6, y6 + m*0.5);

pickup nib;

paths[0]:= z0{right}..z1..{left}z2..z3{dir 280}..{dir 240}z4{dir 30}..{dir 30}z5{dir 30}..z6...{dir 60}z7;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3, 6)
    nib(default_nib xyscaled(1.25,.1) rotated 120)(0) % Sharp cut
    nib(default_nib xyscaled(1.25,.1) rotated 150)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

find_outlines(soften_path(strokes[0], 10) )(r);







endglyph;
end