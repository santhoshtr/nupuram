input glyph;
beginglyph;
z0 = (x1 + mw/8, 0.5m);
z1 = (0, 0.75m);
z2 = (x1 + mw/4, m);
z3 = (x2 + mw/4, .66m);
z4 = (x3, .45m);

paths[0] = z0.. z1..z2{dir -8}..{down}z3---z4 ;
pen_stroke(
    nib(thinnib)(1, 3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

clearxy;
z0 =  point 3 of paths[0] ;
z1 = (x0 + mw/3, m);
z2 = (x1 + mw/4, m/2);
z3 = (x2 - 0.6mw, 0);

paths[1] = z0{dir 80}..z1{dir -10}..z2.. z3;

pen_stroke(
    nib(thicknib)(1)
    nib(thinnib)(2)
    nib(thinterminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

endglyph;
