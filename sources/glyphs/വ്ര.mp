input glyph;
beginglyph;

paths[0] := ra shifted(mw/3, 0);
paths[1] := va_tail shifted (point 4 of paths[0]) ;
z11 = point 2 of paths[1];
z12 = (x11+0.1mw, y11- 0.6m);
z13 = (xpart(point 2 of paths[0]), -descent*1.2);
z14 = (0, m/2);
z15 = (x14+0.2mw, m);
paths[2] = z11{dir -60}..z12..{dir 180}z13..z14 ..  z15;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(0,3)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


anchor( "vc",  point 2 of paths[0] );
anchor( "right", point 1.25 of paths[2]);


endglyph;
