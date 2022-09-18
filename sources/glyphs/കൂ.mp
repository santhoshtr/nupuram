input glyph;
beginglyph;

z0=(3/4mw, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - 0.5m);
z3=(x2 - mw/3, y2 - 0.5m);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + 0.3m);
z8=(x7 + mw, y7 + 0.1m );
z9=(x8 + mw/4, y8 - 0.2m);
z10=(x8, y8 - 0.35m); % <
z11= (x10 + mw/3, 0);
z12 = (x2, -descent*1.2);
z13 = (x12 - 0.75mw, y12);
z14 = (0, y4);
z15 = (x6, m );

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7 .. z8 ..z9{down}..{left}z10{right}..z11..{dir 190}z12..{dir 170}z13.. z14 .. z15 ;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4, 6, 9, 11, 14,15)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle 10 of paths[0])(10)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


endglyph;
