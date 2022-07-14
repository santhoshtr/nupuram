input glyph;
beginglyph;
z0=(2u, 0);
z1=(x0 - m/3 , m/2);
z2=(x1 + m/4, y1 + m/2);
z3=(x2 + m/3, y2-m/2);
z4=(x3, y3-m/3);
% Second arch
z5 = z3;
z6 = (x5 + m/3, y5 + m/3);
z7 = (x6 + m/4, y6 - m/3);
z8 = (x7 - m/3, y7 - m/2);
z15=(x8 , 0);
z16=(x15 + 0.6m, y15);
z17=(x16, y16 + m/2);
z18=(x17, y17 + m/2);
paths[0] = z0{dir 135}..z1..{right}z2..z3 ---z4;
paths[1] = z5{up}..z6..z7..z8;
paths[2] = z15{dir 30}..{dir 30}z16{dir 30}..z17...{dir 60}z18;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, 1) rotated 0 )(2)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(1,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
