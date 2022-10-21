input glyph;
beginglyph;
z0= (.75Xw, 0.5X);
z1=( x0 - Xw/2.5, y0 + 0.5X);
z2=( x1 - Xw/2.5, y1 - 0.5X);
z3=( x2 + Xw/2.5, 0);
z4=( x3 + Xw/2.5, y3 + 0.5X);
z5=( x4 - 0.4Xw, y4*0.9);
paths[0] = z0{dir 80}..z1{dir 190}..  z2..z3..{dir 100}z4{left}.. z5 ;
paths[0] := paths[0] cutbefore point 0.3 of paths[0];
pen_stroke(
    nib(thinnib rotated 0 )(  2, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
anchor( "top", (xpart(point 1 of paths[0]), 1.2X) );
endglyph;
