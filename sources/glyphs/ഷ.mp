input glyph;
beginglyph;

z0=(mw/6, -thick/4);
z1=(0, y0 + m/3);
z2=(x0 + mw/6, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x2, 0);
z5=(x4, 0);
z6=(x5 + mw, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.5);
z9 = z8;
z10 = (x9 - 0.3mw, y9-0.5m);
z11 = (x10 - 0.3mw, y10 + 0.5m);
z12 = (x11 + 0.3mw, y11 - 0.4m);
z13 = (x12, y12- 0.6m);
paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] = z5{dir 30}..{dir 30}z6{dir 30}..z7...{dir 80}z8;
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


anchor( "vc", (x11,0));
anchor( "bottom", (x7,0));
anchor( "right", (x7,0));

endglyph;
