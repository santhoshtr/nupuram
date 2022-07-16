input glyph;
beginglyph;
z0=(0.5sw, X);
z1=(x0-0.3s , 0.9X);
z2=(x1 , 0.5s);
z3=(x2 , 0);
% t
z10=(x2 + sw/2, X);
z11=(x10 , 0.5X);
z12=(x11, 0.1X);
z13=(x12 + 0.3sw, 0);
%bar
z4 = (x2 -0.25sw,s);
z5 = (x4 + sw,y4);
paths[0] = z0 ..z1..  z2..z3;
paths[1] = z10{dir -80}..z11..  z12..z13;
paths[2]:= z4{dir 20}..{dir 20}z5;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1, 2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
