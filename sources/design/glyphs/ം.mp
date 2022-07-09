input glyph;

beginglyph;
path paths[], strokes[], r;
donotsoften := 1;

z0=(0, 0.25m);
z1=(x0 + 0.2m, y0 + 0.25m);
z2=(x1 + 0.2m, y1 - 0.25m);
z3=(x2 - 0.2m, y2 - 0.25m);
z4=(x3 - 0.2m, y3 + 0.25m);

pickup nib;

paths[0]:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);


endglyph;
end