input glyph;
beginglyph;
paths[0] := ra;
paths[1] := va_tail shifted (point 4 of paths[0]) ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 120)(7)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 170)(infinity)
)(paths[1])(strokes[1]);

% Shoe
z10 = (point 1 of paths[1]) + (thick/2,thick);
z11 = (x10, -descent- thick/2)  ;
z12 = (xpart(point 0 of paths[1]), y11 );
z13 = (x12 + mw/3, ypart(point 1 of paths[1]));
paths[2] = z10{dir 250}..{dir -70}z11{left}..{left}z12{dir 30}..{dir 60}z13;
pen_stroke(
    nib(thicknib rotated 0 )( 3)
    nib(terminalnib rotated 135)(2)
    nib(thinterminalnib rotated 0)(0)
    nib(terminalnib rotated 45)(1)
    nib(terminalnib rotated 0)(infinity)
)(paths[2])(strokes[2]);
endglyph;
