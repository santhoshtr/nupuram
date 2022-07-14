input glyph;
beginglyph;
path paths[], strokes;
z0=(1u, s);
z1=(x0 , y0-s/2);
z2=(x1, 0);
z3= ( x1, 0.3s );
z4=(x3 + 0.4s, s);
z5=(x4 + 0.4s, y4-.5s);
z6=(x5, y5-0.5s);

paths[0] := z0{dir 300} ..z1 .. {dir -80}z2 ;
paths[1] := z3{up}..  z4..{dir 250}z5{dir 250}..z6;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(2)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
