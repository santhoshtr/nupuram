input glyph;
beginglyph;

% Left slant
z0= (0, 0);
z1 = (x0 + (x2 - x0)/2 - thick/2, X/2);
z2= (x1 + 0.25Xw, X );


% Right slant
z3=(x2, X);
z4=(x3 + (x5 - x3)/1.5 , y1);
z5=(x3 + 0.3Xw, y0);
paths[0] = z0 .. {dir 70}z1 .. {dir 55}z2;
paths[1] = z3{dir -45} .. z4.. z5;
% bar
z6 = point 0.8 of paths[0] ;
z7 = point 1.2 of paths[1] ;

paths[2]:= z6 .. z7 ;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "top", (xpart(point 2 of paths[0]), 1.2X) );
endglyph;
