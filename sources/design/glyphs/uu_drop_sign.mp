input glyph;

beginglyph;

soften := 0;

z0=(0.2m,  0);
z1=(x0 + 0.2m, y0 - 0.2m);
z2=(x1 - 0.2m, y1 - 0.2m);
z3=(x2 - 0.2m, y2 + 0.2m);
z4=(x3 + 0.2m, y3 + 0.2m);
z5=(x4 + 0.4m, y4 - 0.3m);
z6=(x5 - 0.45m, y5 - 0.3m);



paths[0]:= z0..z1{down}...z2{left}..{up}z3..z4..z5..z6 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(2 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 1, 3, 4, 5)
    nib(default_nib xyscaled(1, terminalround) rotated 60)(infinity) % Sharp cut
)(paths[0])(strokes[0]);


endglyph;
