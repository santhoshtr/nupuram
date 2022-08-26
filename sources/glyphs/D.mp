input glyph;
beginglyph;
w := s;
z0= (0, X);
z1=( x0, y0 - 0.5X);
z2=( x1, y1 - 0.5X);
z3 = (x0, X - 0.2X);
z4 = (x3 + w/2, y0);
z5 = (x4 + w/2, y4 - 0.5X );
z6 = (x4, y5 - 0.45X );
z7 = (0, y6 + 0.1X);
paths[0] = z0{dir -60}..z1..z2 ;
paths[1] = z3{dir 60}..z4..z5.. z6 ..z7 ;
pen_stroke(
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0,3)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
anchor( "top", (xpart(point 1 of paths[1]), 1.2X) );
endglyph;
