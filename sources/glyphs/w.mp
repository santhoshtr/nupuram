input glyph;
beginglyph;
z0=(0, s);
z1=(x0 + 0.1*sw, s/2);
z2 =(x1 - 0.05sw, 0);
paths[0] = z0..z1..z2 ;

z3 =(x2, 0);
z4= (x1 + sw/2, .75s);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

paths[1] = z3..{up}z4;
pen_stroke(
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0 = (xpart(point 1 of paths[1]), 0.75s);
z1 = (x0, s/2);
z2 = (x1 + sw/3, thick/4);
z3 = (x2 + sw/3, y1);
z4 = (x2, s);
paths[2] = z0{down} ..z1..z2{dir 10}..z3{dir 90}.. z4;


pen_stroke(
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "top", (xpart(point 1 of paths[1]), X) );
endglyph;
