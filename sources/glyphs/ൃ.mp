input glyph;
beginglyph;
z0= (mw, m);
z1=(x0 + 0.1mw, y0 - 0.5m);
z2= (x1, y1 - 0.6m);
z3=( x2 - mw/4, y2 - m/3);
z4=( x3 - mw/2, y3 + m/6);
z5=( x4 + mw/3, y4 + m/6);
z6=( x5 + mw/3 - thick/4, y5 - .1m);

paths[0] = z0{dir 270} ..  z1{dir 280}..  z2..z3.. z4 ..z5{dir -10}..z6;
paths[0] := paths[0] shifted(-mw, 0);
pen_stroke(
    nib(thinnib rotated 0 )(1, 2, 5, 4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
