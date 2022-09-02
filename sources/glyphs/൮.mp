input glyph;
beginglyph;

paths[0] := ra;
paths[1] := va_tail shifted (point 4 of paths[0]) ;
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

% tail
z11 = point 1.6 of paths[1];
z12 = (x11, -descent/2 );
z13 = (x12 - mw/2, -descent);

paths[2] = z11{dir -80}..z12 .. {dir 150}z13 ;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
endglyph;
