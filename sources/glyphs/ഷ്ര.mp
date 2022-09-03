input glyph;
beginglyph;

paths[0] := pa_mouth;
paths[0] := paths[0] shifted (mw/3, 0);

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
paths[2] = z4{dir 260}..z5 ..z6 ..{down}z7..z8;
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


clearxy;
% ra sign
z0 = point 1.7 of paths[1];
z1 = ( xpart(point 0.6 of paths[1]), -descent - thick);
z2 = (0, m/3);
z3 = (xpart(point 1 of paths[0])-mw/4, m);
paths[3] = z0{dir -75}..z1..z2 .. {dir 60}z3;
pen_stroke(
    nib(thinnib rotated 0 )(2, 4)
    nib(thinterminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

anchor( "vc", point 0.5 of paths[1]);
anchor( "bottom",  point 0.5 of paths[3]);
anchor( "right", point 0.5 of paths[3]);

endglyph;
