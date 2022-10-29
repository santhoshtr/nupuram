input glyph;
beginglyph;

z0=(0.045mw, 0.6m);
z1=(x0 + mw/2, y0 - m/4 );
z2=(x1 - mw/4,  thick/2);
z3=(0, 0.5m);
z4=(x3 + mw/2, m);
z5=(x4 + mw/2.4, m/2);
z6=(x5 - mw/6, 0);
paths[3]:=z0  .. z1{down}..z2{left}..z3.. z4..{down}z5..z6;
pen_stroke(
    nib(thinnib rotated 0 )(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[3])(0)
    nib(terminalnib rotated terminalangle infinity of paths[3])(infinity)
)(paths[3])(strokes[3]);

% എ
clearxy;
paths[0] = pa_mouth shifted (xpart(point 5 of paths[3]) + thick, 0);
z5= point infinity of paths[0];
z6=(x5 + mw, y5);
z7=(x6, y6 + m/3);
z8=(x7, 0.8m);

paths[1] := z5{dir 20}..{dir 20}z6{dir 20}..z7..{dir 60}z8;
z11 = point 1.4 of paths[1];
z12 = (x11 - mw/4, -descent);
% z13 = (x12 - mw/3, y12);
z14 = (x12 - mw/3, m/2);
z15 = (x14 + mw/2, m);
z16 = (x15 + mw/2, y15 - 0.5m);
z17 = (x16 - mw/6, -0.2m);
paths[2] = z11{down}..z12 ... z14  .. z15  ..z16 ..z17;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated (terminalangle infinity of paths[0]))(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated (terminalangle infinity of paths[1]))(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3, 5)
    nib(thinnib rotated 0 )(0,2, 4)
    nib(terminalnib rotated (terminalangle infinity of paths[2]))(infinity)
)(paths[2])(strokes[2]);

endglyph;
