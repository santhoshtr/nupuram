input glyph;

beginglyph;
path paths[], strokes;
soften := 0;

z0=(1u, 0.5m);
z1=(x0 + 0.4m, y0 + 0.5m);
z2=(x1 + 0.4m, y1 - 0.5m);
z3=(x2 - 0.4m, y2 - 0.5m);
z4=z0;



paths[0]:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4;
paths[0]:=paths[0] crotated -18;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);

endglyph;
