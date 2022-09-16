input glyph;
beginglyph;
z0=(Xw/3, X - thick/4);
z1=(x0, y0- .5X);
z2=(x1, 0);
z3 = (0, y0-thick/4) ;
z4 = (x0 + Xw/3, y3) ;
paths[0] = (z0{down}..z1..{down}z2) xyscaled(0.5, 0.5) shifted (0,0.8s);
paths[1] = (z3 .. z4 ) xyscaled(0.5, 0.5) shifted (0,0.8s);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
clearxy;
z0= (thick/2, X);
z1=( x0, X/2);
z2=( x1, 0);
z3 = (x0, y0);
z4 = (x3 + 0.66X/2, 0.33X);
z5 = (x4, y4);
z6 = (x4 +  0.66X/2, y0);
z7 = (x6, y1);
z8 = (x7, y2);

paths[2] = (z0{down}..z1..  {down}z2) xyscaled(0.5, 0.5) shifted (0.6s,0.8s);
paths[3] = (z3..z4) xyscaled(0.5, 0.5) shifted (0.6s,0.8s);
paths[4] = (z5..z6) xyscaled(0.5, 0.5) shifted (0.6s,0.8s);
paths[5] = (z6{down}..z7 .. {down}z8 ) xyscaled(0.5, 0.5) shifted (0.6s,0.8s);;
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
pen_stroke(
    nib(thicknib rotated 0 )(2 )
    nib(thinnib rotated 0 )(1)
    nib(thinterminalnib rotated terminalangle 0 of paths[4])(0)
    nib(terminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);
pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[5])(0)
    nib(terminalnib rotated terminalangle infinity of paths[5])(infinity)
)(paths[5])(strokes[5]);
endglyph;
