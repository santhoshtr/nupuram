input glyph;

beginglyph;
path paths[], strokes[], r;

z0=(1u, X);
z1=(x0 - 0.5u, 0.5X);
z2=(x1, 0);

z3= z2;
z4=(x3+0.4s, s);
z5=(x4+0.3s, y4-.5s);
z6=(x5, y5-0.5s);

pickup nib;

paths[0] := z0 ..z1..{dir 240}z2{dir 30};
paths[1] := z3{dir 60}..{right}z4{right}..{dir 260}z5{dir 260}..z6;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,.1) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,.1) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(2)
    nib(default_nib xyscaled(thin,.1) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,.1) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
end