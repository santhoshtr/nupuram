input glyph;
beginglyph;

loop_slant=tand(10);
z0 =(0, m/2);
z1=(x4 + 2/3* mw/3, y3 - m/4 + thick/4);
z2=(x4,  0);
z3=(0, m/2) - (thick*0.15, 0);
z4=(x3 + m/3, m);

paths[0] = z0  .. z1..  z2.. {up}z3 ..z4  ;
paths[0]:=paths[0] slanted loop_slant;
paths[0]:=paths[0] shifted (-loop_slant*m/2,0);
paths[0]:=paths[0]   .. subpath(3, 6) of da shifted (xpart(z4), 0) ;
pen_stroke(
    nib(thicknib rotated 0 )( 2, 4)
    nib(thinnib rotated 0 )( 1,3,5,7 )
    nib(terminalnib rotated terminalangle 0 of paths[0] )( 0 )
    nib(terminalnib rotated terminalangle 6 of paths[0] )( 6 )
    nib(terminalnib rotated terminalangle infinity of paths[0] )( infinity )
)(paths[0])(strokes[0]);


clearxy;
z0 = (x1 + mw/8, 0.5m);
z1 = (0, 0.75m);
z2 = (x1 + mw/4, m);
z3 = (x2 + mw/4, .66m);
z4 = (x3, .45m);

paths[1] = z0.. z1..z2{dir -8}..{down}z3---z4 ;
paths[1]:= paths[1] shifted(xpart(point 7 of paths[0]) + 2rbearing, 0);
pen_stroke(
    nib(thinnib rotated 0 )(1, 3 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

clearxy;
z0 =  point 3 of paths[1] ;
z1 = (x0 + mw/3, m);
z2 = (x1 + mw/4, m/2);
z3 = (x2 - 0.6mw, 0);

paths[2] = z0{dir 80}..z1{dir -10}..z2.. z3;

pen_stroke(
    nib(thicknib rotated 0 )(1)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

endglyph;
