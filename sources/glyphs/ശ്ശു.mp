input glyph;
beginglyph;

z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y2 + 0.5m);
z4=(x3 + mw/4, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.6m);
z6=(x5 - mw/4, y5 - 0.3m);
z7=(x6 - mw/4, y6 + 0.3m);
z8=(x7 + mw/3  + thick/2, y7 + 0.4m);

paths[0] = z0..z1{down} ..{right}z2{right} ..z3..z4..z5 ..z6..z7..{right}z8 ;
% paths[1] = paths[0]  xscaled 0.8 yscaled 0.75 shifted (0.25mw, -.666m);
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
)(paths[0])(strokes[0]);

clearxy;
z0=(x1 + mw/6, m);
z1=(0, m/2);
z2=(x1 + mw/4, thick/2);
z3=(x2 + mw/4, y2 + 0.5m);
z4=(x3 + mw/3, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.6m);
z6=(x5 - mw/4, 0.05m);
z7=(x6 - mw/4, y6 + 0.3m);
z8=(x7 + mw/3  + thick/2, y7 + 0.4m);
z9=(x8 + mw/2, m/3);
z10=(x7, -descent);

paths[1] = z0..z1{down} ..{right}z2{right} ..z3..z4..z5  ..z6..z7.. z8..z9..{dir 190}z10 ;
paths[1] := paths[1]  xscaled 0.8 yscaled 0.75 shifted (0.25mw, -.666m);

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

% tail
clearxy;
z0 = (xpart (point infinity of paths[1]), -descent );
z1 = ((x0 + x2)/2, y0 );
z2 = (xpart (point 9 of paths[1]) + thick/2, y0);

paths[2]:= z0{dir 20}..z1..{dir 20}z2;
paths[2] := paths[2]  xscaled 0.8 yscaled 0.75 shifted (0.25mw, -.666m);
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", point 4 of paths[0]);
rbearing:=-2*rbearing;
endglyph;
