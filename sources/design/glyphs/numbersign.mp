input glyph;
beginglyph;
w := s/4;
z0= (1.5w, s);
z1=( x0-w/2, y0 - 0.5s);
z2=( x1-w/2, y1 - 0.5s);

paths[0] = z0..z1..z2 ;
paths[1] = paths[0] shifted (s/3, 0) ;
paths[2] = (0, s/3){dir 10} .. {dir 10}(0.8s, s/3);
paths[3] = paths[2] shifted (0,s/3);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[2])(strokes[2]);

pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[3])(strokes[3]);

endglyph;
