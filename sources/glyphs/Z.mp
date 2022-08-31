input glyph;
beginglyph;

z0=(0, X );
z1=(x0 + .7Xw, X);
z2=((x1-x0)/2, X/2);
z3=(x0, 0);
z4=(x1, 0);

paths[0] = z0{dir 10}..{dir 10}z1;
paths[1] = z1{dir -120}..z2..{dir 250}z3;
paths[2] = z3{dir 10}..{dir 10}z4 ;
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "top", (xpart(point 1 of paths[1]), 1.2X) );
endglyph;
