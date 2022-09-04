input glyph;
beginglyph;

loop_slant=tand(10);
z0 =(x3 + thick*0.15, y3);
z1=(x4 + 2/3* mw/3, y3 - m/4 + thick/4);
z2=(x4,  0);
z3=(0, m/2);
z4=(x3 + mw/3, m);

paths[0] = z0  .. z1..  z2.. {up}z3 ..z4  ;
paths[0]:=paths[0] slanted loop_slant;
paths[0]:=paths[0] shifted (-loop_slant*m/2,0);
paths[0]:=paths[0] .. subpath(3, 5) of da shifted (xpart(z4), 0) ;
z10 = (xpart (point 4.5 of paths[0]), -m/12);
z11 = (xpart (point 0 of paths[0]), -descent);
paths[0] := paths[0]..z10 .. {dir 200}z11;
% Tail
z12 = (xpart (point 0 of paths[0]), -descent );
z13 = (x12 + 0.6mw, y12 );
% Add an extra elongation for tail so that it touches
% the tail of second ള
z14 = (xpart (point 7 of paths[0]) + .18mw, y13);
paths[1] = z12{dir 20}..z13..{dir 20}z14;
pen_stroke(
    nib(thicknib rotated 0 )( 2, 4)
    nib(thinnib rotated 0 )( 1,3,5,7,8 )
    nib(terminalnib rotated terminalangle 0 of paths[0] )( 0 )
    nib(terminalnib rotated terminalangle 6 of paths[0])(6)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

shift = xpart(point 2 of paths[1]);
paths[2] = paths[0] shifted (shift, 0);
% We need to cut the extra elongation we gave for first ള
paths[3] = subpath(0, 1.9) of paths[1] shifted (shift, 0);
pen_stroke(
    nib(thicknib rotated 0 )( 2, 4)
    nib(thinnib rotated 0 )( 1,3,5,7,8 )
    nib(terminalnib rotated terminalangle 0 of paths[2] )( 0 )
    nib(terminalnib rotated terminalangle 6 of paths[2])(6)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", (x14,0));
anchor( "right", (point 1.8 of paths[3]));

endglyph;
