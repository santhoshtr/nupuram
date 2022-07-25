input glyph;
beginglyph;
path paths[],strokes;

z0 = (.5u, 0.6m);
z1 = (x0 + 0.25mw, y0   );
z2 = (x1 + 0.25mw, y1 - 0.3m);
z3 = (x2 - 0.25mw, y2 - 0.3m);
z4 = (x3 - 0.3mw, y3 + 0.5m);
z5 = (x4 + 0.5mw, y4 + 0.5m);
z6 = (x5 + 0.35mw, y5 - 0.3m);
z7 = (x6 - 0.2mw, y6 - 0.25m);
z8 = (x7 + 0.35mw, y7 - 0.2m);
z9 = (x8 - 0.35mw, y8 - 0.2m);

paths[0] = z0  .. z1..  z2..{left}z3 ;
paths[1] = z3{left}..z4 .. z5..z6.. {dir 200}z7 ;
paths[2]:= z7..z8..z9;
pen_stroke(
    nib(thicknib rotated 0 )(0, 1, 3 )
    nib(thinnib rotated 0 )( 2 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0,2, 4)
    nib(thinnib rotated 0 )(1,3)
    nib(thinterminalnib rotated 120)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(0,4)
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 120)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[2])(strokes[2]);

endglyph;
