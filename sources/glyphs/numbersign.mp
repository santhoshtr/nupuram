input glyph;
beginglyph;
% This glyph does not slant. Reset slant value
slant := 0;
w := m/4;
z0= (1.5w, m);
z1=( x0-w/2, y0 - 0.5m);
z2=( x1-w/2, y1 - 0.5m);

paths[0] = z0..z1..z2 ;
paths[1] = paths[0] shifted (m/3, 0) ;
paths[2] = (0, m/3){dir 10} .. {dir 10}(0.8mw, m/3);
paths[3] = paths[2] shifted (0, m/3);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

endglyph;
