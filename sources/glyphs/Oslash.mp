input glyph;
beginglyph;
z0=(0, X/2 );
z1=(x0 + 0.4Xw, y0 + 0.5X - thick/4);
z2=(x1 + 0.4Xw, y0);
z3=(x1, thick/4);
z4=(x0, y0);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;

pen_stroke(
      nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4)
)(paths[0])(strokes[0]);

clearxy;
z0= (xpart(point 2 of paths[0]), X);
z1=( xpart(point 1 of paths[0]), (y0+y2)/2);
z2=( xpart(point 0 of paths[0]), -X*0.05);

paths[1] = z0{dir 260}..z1..{dir 260}z2 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
