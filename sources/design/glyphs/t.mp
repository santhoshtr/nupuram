input glyph;
beginglyph;
path paths[], strokes;
z0=(1u, X);
z1=(x0 , 0.5X);
z2=(x1, 0.1X);
z3=(x2 + 0.3s, 0);
%bar
z4 = (x0-0.25s,s);
z5 = (x4 + 0.5s,y4);
paths[0] = z0{dir -80}..z1..  z2..z3;
paths[1] = z4{dir 20}..{dir 20}z5;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
