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

endglyph;
