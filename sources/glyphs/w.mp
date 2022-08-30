input glyph;
beginglyph;
z0=(x1 + sw/4, s);
z1=(0, s/2);
z2 =(x0, thick/4);
z3 =(x2 + sw/3 , 0.6s);
paths[0] = z0..z1..z2..{up}z3 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0 = (xpart(point 3 of paths[0]), 0.75s);
z1 = (x0, s/2);
z2 = (x1 + sw/3, thick/4);
z3 = (x2 + sw/3, y1);
z4 = (x2, s);
paths[1] = z0 ..z1..z2..z3.. z4;


pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "top", (xpart(point 1 of paths[1]), X) );
endglyph;
