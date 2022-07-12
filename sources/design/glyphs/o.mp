input glyph;

beginglyph;
path paths[], strokes;
soften := 0;

z0=(0, 0.5s);
z1=(x0 + 0.4s, y0 + 0.5s);
z2=(x1 + 0.4s, y1 - 0.5s);
z3=(x2 - 0.4s, y2 - 0.5s);
z4=(x3 - 0.4s, y3 + 0.5s);



paths[0]:= z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2, 4)
)(paths[0])(strokes[0]);

endglyph;
end