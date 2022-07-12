input glyph;

beginglyph;
path paths[], strokes;

z0=(1u, X);
z1=(x0 - 0.5u, 0.5X);
z2=(x1, 0);
z3=(x2 + 4u, y2 );



paths[0]:= z0 ..z1..{dir 240}z2{dir 30}..{dir 30}z3;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 3, 5 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,   4, 6)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
end