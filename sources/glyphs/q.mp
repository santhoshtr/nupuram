input glyph;
beginglyph;
paths[1] := a_loop;
z0=(x1 +  thick/4, s);
z1=(0, y0-X/2);
z2=(x0, -descent*1.2);
paths[0] := z0{dir -110}..z1.. {dir -100}z2;
paths[0] := paths[0] shifted(xpart(point 0 of paths[1]),0);

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 0 )(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
