input glyph;
beginglyph;

z0 = (x1 + mw/4, m);
z1 = ( 0, m/2 );
z3 = ( x1 + 2/3m , -m/3);

paths[0] = z0..z1..{right}z3;

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
rbearing:=-x0;
endglyph;
