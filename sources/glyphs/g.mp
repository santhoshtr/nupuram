input glyph;
beginglyph;

paths[0] = a_loop;

z5 = (xpart(point 4 of a_loop), s);
z6 = (x5, s/2);
z7 = (x5 - sw/6 , -descent);
z8 = (xpart(point 2 of a_loop), -descent + thick/2);

paths[1] = z5 .. z6 ..  z7 .. z8;
pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[0] )(0 )
    nib(thinterminalnib rotated terminalangle infinity of paths[0] )(infinity )
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1] )(0 )
    nib(terminalnib rotated terminalangle infinity of paths[1] )(infinity )
)(paths[1])(strokes[1]);

endglyph;
