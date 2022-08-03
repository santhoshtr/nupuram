input glyph;
beginglyph;
soften:=0;
slant:= .16;
z0 = (0, s/2);
z1 = (x0 + sw/3, s );
z2 = (x1 + sw/3, y0 );
z3 = (x2 - sw/3, 0 );
paths[0]:= z0{up}..z1{right}..z2{down}..z3{left}..{up}z0;
paths[0]:= paths[0] slanted slant;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4)
)(paths[0])(strokes[0]);
endglyph;
