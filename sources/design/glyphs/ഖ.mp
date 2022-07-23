input glyph;
beginglyph;
path paths[],strokes;

z0 = (0.2mw, 0.15m);
z1 = (x0  + 0.2mw, y0 + 0.25m );
z2 = (x1 + mw/4, y1 - 0.2m);
z3 = (x2 - mw/4, y2 - 0.2m);
z4 = (x3 - mw/3, y3 + m/2);
z5 = (x4 + mw/2, y4 + m/2);
z6 = (x5 + mw/2, y5 - m/2);
z7 = (x6 - 0.3mw, 0);
z15=(x7, 0);
z16=(x15 + 0.6mw, y15);
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
    nib(default_nib xyscaled(1,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
