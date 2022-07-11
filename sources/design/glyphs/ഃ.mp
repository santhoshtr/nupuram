input glyph;

beginglyph;
path paths[], strokes;
donotsoften := 1;

z0=(0, 0.25m);
z1=(x0 + 0.2m, y0 + 0.2m);
z2=(x1 + 0.2m, y1 - 0.2m);
z3=(x2 - 0.2m, y2 - 0.2m);
z4=(x3 - 0.2m, y3 + 0.2m);



paths[0]:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[0]:= paths[0] xyscaled (0.75, 0.75);
paths[1]:= paths[0] shifted (0, 0.5m) ;

pen_stroke(
    nib(default_nib scaled(1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);

strokes[1]:= strokes[0] shifted (0, 0.5m)  ;

endglyph;
end