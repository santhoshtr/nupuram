input glyph;
beginglyph;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y2 + 0.5m);
z4=(x3 + mw/3, y3 + 0.4m);
z5=(x4 + mw/2, y4 - m/2);
z6=(x5 - mw/4, 0.2m);
z7=(x6 - mw/4, y6 + 0.25m);
z8=(x7 + mw/2, y7 + 0.4m);

paths[0] = z0..z1{down} ..{right}z2{right} ..z3..z4..z5  ..z6..z7..{right}z8 ;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

% tail
clearxy;
z0=(mw*1.2, 0);
z1=(x0 + 0.8mw, y0);
z2=(x1, y1 + m/2);
z3=(x2, y2 + m/2);
paths[2] := z0{dir 20}..{dir 20}z1{dir 20}..z2...{dir 60}z3;

% Mouth of ച
clearxy;
z2=(xpart(point infinity of paths[0]), ypart(point infinity of paths[0]));
z3=(x2 + mw/3, y2- m/4);
z4=point 0 of paths[2];

paths[1] = z2{right}..z3 .. {dir 200}z4;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);


anchor( "vc", point 4 of paths[0]);
anchor( "bottom", point 1 of paths[2]);
anchor( "right", point 1 of paths[2]);
endglyph;
