input glyph;
beginglyph;

z0=(x1 + 0.1mw, 0.3m);
z1=(0, y0 + m/4);
z2=(x1 + mw/4, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x0, thick/5);


z5=(0, 0);
z6=(x5 + 1.1mw, y5);
z7=(x6, y6 + m/2);
z8=(x7, y7 + m/2);

paths[0] = z0{dir 130}..z1..{right}z2..z3 .. {dir 200}z4;
paths[0] := paths[0] slanted tand(8);
paths[0] := paths[0] shifted (mw/8, 0);
paths[1] := z5{dir 20}..{dir 20}z6{dir 20}..z7...{dir 60}z8;


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

% Shoe
z9 = point .5 of paths[1];
z10 = (x9 -mw/4, -descent*1.1) ;
z11 = (xpart(point 1.4 of paths[1]), y10) ;
z12 = point 1.4 of paths[1];
paths[2] := z9{down}..{dir 200}z10{dir 10}..{dir -10}z11{dir 80}..{dir 100}z12;
pen_stroke(
    nib(thicknib rotated 0 )(3)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", z2);
anchor( "bottom", z11);
anchor( "right", z11);
endglyph;
