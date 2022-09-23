input glyph;
beginglyph;
z0=(sw/6, 0.95X);
z1=(x0 , 0.66s);
z2=(x1 + sw/4, thick/4);
z3=(x2 + sw/3, s/4);
paths[0] = z0{dir -80}..z1{dir -95}..z2{right}..{dir 60}z3;
%bar
z4 = (0, s);
z5 = (x2 + sw/4, y4);

paths[1] = z4{dir 10}.. z5;
pen_stroke(
    nib(thicknib rotated 0 )(0  )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "top", (xpart(point 2 of paths[0]), X) );
anchor( "bottom", (xpart(point 2 of paths[0]), 0) );
rbearing:=0;
endglyph;
