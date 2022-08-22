input glyph;
beginglyph;

z0 = ( 0, -descent);
z1 = ( x0 + 2/3m, y0 );
z2 = z1;
z3 = ( x2 - mw/6, m/3);
z4 =  ( x3+mw/10, m);

paths[0] = z0{dir 20}..{dir -20}z1;
paths[1] = z2..z3..z4;

paths[0] := paths[0] shifted(-x2 + thick, 0);
paths[1] := paths[1] shifted(-x2 + thick ,0);

pen_stroke(
    nib(terminalnib rotated terminalangle 0 of paths[0])( 0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thinnib rotated 45)(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])( 0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
endglyph;
