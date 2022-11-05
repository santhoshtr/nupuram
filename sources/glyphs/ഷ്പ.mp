input glyph;
beginglyph;

paths[0] := pa_mouth;
z0 = point infinity of paths[0];
z1=(x0 + 1.1mw, y0);
z2=(x1, y1 + m*0.5);
z3=(x2, y2 + m*0.5);
z4 = z3;
z5 = (x4 - 0.35mw, y4-0.5m);
z6 = (x5 - 0.35mw, y5 + 0.5m);
z7 = (x6 + 0.3mw, y6 - 0.4m);
z8 = (x7, y7- 0.6m);
paths[1] = z0{dir 30}..{dir 30}z1{dir 30}..z2...{dir 80}z3;

z9 =  point infinity of paths[1];
z10 = (x9 - 0.3mw, y9-0.5m);
z11 = (x10 - 0.3mw, y10 + 0.5m);
z12 = (x11 + 0.3mw, y11 - 0.4m);
z13 = (x12, y12- 0.6m);

paths[2] = z9{dir 260}..z10 ..z11 ..{down}z12..z13;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1,2)
    nib(thinnib rotated 0 )( 3)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

% Below base
paths[3] = paths[0] shifted (xpart(point 3 of paths[0]), -m/1.5) xyscaled (0.8, 0.8);
paths[4] = paths[1] shifted (xpart(point 3 of paths[0]), -m/1.5) xyscaled (0.75, 0.8);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[4])(0)
    nib(terminalnib rotated terminalangle infinity of paths[4])(infinity)
)(paths[4])(strokes[4]);
endglyph;
