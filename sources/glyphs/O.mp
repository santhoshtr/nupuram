input glyph;
beginglyph;
z0=(0, X/2 );
z1=(x0 + 0.4Xw, y0 + 0.5X - thick/4);
z2=(x1 + 0.4Xw, y0);
z3=(x1, thick/4);
z4=(x0, y2);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 1 of paths[0]), 1.2X) );
endglyph;
