input glyph;

beginglyph;
path paths[], strokes;

z0=(1u, 0.6m);
z1=(x0 + 0.25m, y0 + 0.3m);
z2=(x1 + 0.25m, y1 - 0.4m);
z3=(x2 - 0.3m, y2 - 0.4m);
z4=(x3 - 0.25m, y3 + 0.3m);

paths[0]:= z0..{right}z1..{down}z2..z3{left}..z4;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 4 )
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

endglyph;
end