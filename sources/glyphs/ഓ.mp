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
slant_ := tand(-8);
height_correction :=  thick/4;
z0=(0, m/2);
z1=(x0 + mw/3, m - height_correction);
z2=(x1 + mw/3, y0);
z3=(x2 - mw/3,  height_correction);
paths[1] = z0 .. z1.. z2 .. z3 ..  cycle;
paths[1] := paths[1] slanted slant_;
paths[1] := paths[1] shifted (-slant_*m/2, 0);
paths[1] := subpath(.3, 2.9) of paths[1]   ..  {dir 120}(x0, y0 - m/4);

paths[1] := paths[1] shifted (xpart(point 7 of paths[0]) + thick, 0);

pen_stroke(
    nib(thinnib rotated 0 )(2 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;

