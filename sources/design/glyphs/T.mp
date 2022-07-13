input glyph;

beginglyph;
path paths[], strokes;

w:=0.75X;
z0=(w/2, X);
z1=(x0, y0- .5X);
z2=(x1, y1- .5X);

z3 = (x0 - w/2, y0 - .6u) ;
z4 = (x3 + w/2, y3 + u/4) ;
z5 = (x4 + w/2, y4 + u/4) ;

paths[0]:= z0 ..z1..z2;
paths[1]:= z3..z4..z5;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 110)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[1])(strokes[1]);

endglyph;
