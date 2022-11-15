input glyph;
beginglyph;

paths[1] := a_loop;

z0=(thick/2, X);
z1=(x0,  y0 - X/2);
z2=(x1, 0);

paths[0] = z0{dir -80}..z1..  {dir -80}z2 ;
paths[0] := paths[0] shifted(xpart(point 0 of paths[1]) - thick/2 , 0);
pen_stroke(
    nib(thinnib)(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
