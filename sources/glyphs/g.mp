input glyph;
beginglyph;

paths[0] = a_loop;
clearxy;
z0 = (xpart(point 0 of paths[0]) , s );
z1 = (x0, ypart(point 3 of paths[0]));
z2 = (x1 - sw/6 , -descent - thick/2);
z3 = (xpart(point 2 of paths[0]), -descent );
paths[1] = z0{dir -100} ..z1  ..  {dir 225}z2.. {dir 120}z3;
pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[0] )(0 )
    nib(thinterminalnib rotated terminalangle infinity of paths[0] )(infinity )
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1] )(0 )
    nib(terminalnib rotated terminalangle infinity of paths[1] )(infinity )
)(paths[1])(strokes[1]);
anchor( "top", (xpart(point 1 of paths[0]), X) );
endglyph;
