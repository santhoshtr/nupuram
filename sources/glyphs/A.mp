input glyph;
beginglyph;

% Left slant
z0= (0, 0);
z1 = (x0 + (x2 - x0)/2 - thick/2, X/2);
z2= (x1 + 0.25Xw, X );
z3=(x2 + (x4 - x2)/1.5 , y1);
z4=(x2 + 0.3Xw, y0);
paths[0] = z0 .. {dir 70}z1 .. {dir 45}z2{dir -45} .. z3..z4;


clearxy;
z0 = point 0.8 of paths[0] ;
z1 = point 3.2 of paths[0] ;

paths[1]:= z0 .. z1 ;
pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "top", (xpart(point 2 of paths[0]), 1.2X) );
endglyph;
