input glyph;
beginglyph;
path paths[],strokes;
soften:=0;
z0 = (u, 0.15m);
z1 = (x0  + 0.2m, y0 + 0.25m );
z2 = (x1 + m/4, y1 - 0.2m);
z3 = (x2 - m/4, y2 - 0.2m);
z4 = (x3 - m/3, y3 + 0.4m);
z5 = (x4 + 0.5m, y4 + 0.5m);
z6 = (x5 + 0.5m, y5 - 0.5m);
z7 = (x6 - 0.3m, 0);
z15=(x7, 0);
z16=(x15 + 0.6m, y15);
z17=(x16, y16 + m*0.5);
z18=(x17, y17 + m*0.5);

paths[0] = z0{up} .. z1..  z2..{left}z3 ;
paths[1] = z3{left}..z4 .. z5.. z6 ..z7 ;
paths[2] := z15{dir 30}..{dir30}z16{dir 30}..z17...{dir 60}z18;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(thin, terminalround) rotated 115)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(1 ,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
