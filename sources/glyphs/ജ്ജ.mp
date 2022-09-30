input glyph;
beginglyph;

z0 = (mw/5 , m);
z1 = (x0 + mw/5, y0 - m/4);
z2 = (x1 - mw/5, y1 - m/3);
z3 = (x2 - mw/5, y2 + m/4);
z4 = (x3 + mw/4, m);
z5 = (x4 + mw/2.4, y4 - m/3);
z6 = (x5, y5 - m/5);
paths[0] = z0  ..z1 ..   z2 .. z3   .. z4  .. z5---z6 ;
pen_stroke(
    nib(thicknib rotated 0 )(0,   3 )
    nib(thinnib rotated 0 )(1,3,5)
    nib(thinterminalnib rotated terminalangle 0 of paths[0] )(0 )
    nib(terminalnib rotated terminalangle infinity of paths[0] )(infinity )
)(paths[0])(strokes[0]);

clearxy;
z0 =  point 5 of paths[0]; % Second arch
z1 = (x0+ mw/3, y0 + m/3 + m/12);
z2 = (x1 + mw/3, y1 - m/3);
z3 = (x2 - mw/2, y2 - m/3);
z4 = (x3 - mw/2, y3 - m/12);
z5 = (x4 - mw/3, 0);

paths[1] = z0{dir 85}..z1 ..z2..z3..z5 ;

pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )( 2,3,4,5,7,9,11)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0 = ( xpart(point infinity of paths[1]) + mw, ypart(point infinity of paths[1]) + m/3);
z1 = (x0 + mw/3, y0 - m/4);
z2 = (x1 - mw/4, y1 - m/4);
z3 = (x2 - mw/4, y2 + m/3+ m/6 - thick*0.12);
paths[2] = point infinity of paths[1]..tension 1.5..z0..z1..z2..z3;

pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

paths[3] = paths[0] shifted (xpart(point 2 of paths[1]), 0);
paths[4] = paths[1] shifted (xpart(point 2 of paths[1]), 0);
paths[5] = paths[2] shifted (xpart(point 2 of paths[1]), 0);
pen_stroke(
    nib(thicknib rotated 0 )(0,   3 )
    nib(thinnib rotated 0 )(1,3,5)
    nib(thinterminalnib rotated terminalangle 0 of paths[3] )(0 )
    nib(terminalnib rotated terminalangle infinity of paths[3] )(infinity )
)(paths[3])(strokes[3]);

pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[4])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 4)
    nib(thinnib rotated 0 )(1, 2)
    nib(terminalnib rotated terminalangle 0 of paths[5])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[5])(infinity)
)(paths[5])(strokes[5]);
endglyph;
