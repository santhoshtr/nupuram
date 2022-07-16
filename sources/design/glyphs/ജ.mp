input glyph;
beginglyph;

soften:=0;
z0 = (u, 0.6m);
z1 = (x0  + 0.2m, y0 + 0.2m );
z2 = (x1 + 0.2m, y1 - 0.2m);
z3 = (x2 - 0.2m, y2 - 0.2m);
z4 = (x3 - 0.3m, y3 + 0.3m);
z5 = (x4 + 0.3m, y4 + 0.3m);
z6 = (x5 + 0.35m, y5 - 0.4m);
z7 = (x6, y6 - .15m);
z8 = (x6, 0.55m);
z9 = (x8 + 0.4m, y8 + 0.45m);
z10 = (x9 + 0.35m, y9 - 0.2m);
z11 = (x10 - 0.5m, y10 - 0.4m);
z12 = (x11 - 0.5m, y11 + 0.05m  ); %not used
z13 = (x12 - 0.3m, y12 - 0.35m);
z14 = (x13 + 0.25m, y13 - 0.2m);
z15 = (x14 + 0.4m, y14 + 0.25m);
z16 = (x15 + 0.4m, y15 + 0.2m);
z17 = (x16 + 0.2m, y16 - 0.2m);
z18 = (x17 - 0.2m, y17 - 0.2m);
z19 = (x18 - 0.2m, y18 + 0.3m);
paths[0] = z0{up} .. z1..  z2..{left}z3 ;
paths[1] = z3{left}..z4{up}..{right}z5..{down}z6..z7;
paths[2]:= z8{up}..z9{right}..{dir 190}z11{dir 190}..   {dir 240}z13 ..z14..z15..z16{right}..z17{down}..{left}z18{left}..{dir 60}z19;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(  2 )
    nib(default_nib xyscaled(thin, terminalround) rotated 120 )(0 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(1, terminalround) rotated 10)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1,  6,10)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 3, 5,7 )
    nib(default_nib xyscaled(thin, thin) rotated 135 )( infinity )
)(paths[2])(strokes[2]);

endglyph;
