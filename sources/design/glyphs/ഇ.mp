input glyph;
beginglyph;
path paths[],strokes;
soften:=0;
z0 = (u, 0.3m);
z1 = (x0  + 0.2m, y0 + 0.25m );
z2 = (x1 + m/4, y1 - 0.2m);
z3 = (x2 - m/4, y2 - 0.2m);
z4 = (x3 - m/3, y3 + 0.4m);
z5 = (x4 + 0.35m, y4 + 0.4m);
z6 = (x5 + 0.4m, y5 - 0.5m);
z7 = (x6, y6 - .3m);
z8 = (x6, 0.45m);
z9 = (x8 + 0.35m, y8 + 0.5m);
z10 = (x9 + 0.35m, y9 - 0.4m);
z11 = (x10 - 0.7m, y10 - 0.6m); % <
z12 = (x11 - 0.7m, y11 - 0.1m);
z13 = (x12 + 0.7m, y12 - 0.05m);
z14 = (x13 + 0.7m, y12);
paths[0] = z0{up} .. z1..  z2..{left}z3 ;
paths[1] = z3{left}..z4{up}..{right}z5..{down}z6..z7;
paths[2]:= z8{up}..z9{right}..{down}z10{down}..{left}z11{left}..{dir 200}z12;
paths[3]:= z12{dir 20}..z13{dir -20}..z14;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(1, terminalround) rotated 10)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2,4 )
    nib(default_nib xyscaled(xthick*xthick, terminalround) rotated 115)(4) % Sharp cut
)(paths[2])(strokes[2]);
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1 )
    nib(default_nib xyscaled(xthick*xthick, terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick*xthick, terminalround) rotated 115)(infinity) % Sharp cut
)(paths[3])(strokes[3]);
endglyph;
