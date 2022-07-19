input glyph;
beginglyph;
path paths[], strokes;
z0=(0, 0);
z1=(x0+0.1X, y0 + .5X);
z2=(x1+0.2Xw, y1 + .5X);
z3=(x2, y2);
z4=(x3 + 0.2Xw, y3 - .5X);
z5=(x4 + 0.1Xw, y4 - .5X);
z6 = (x1 - 0.2Xw, y1 - u) ;
z7 = (x6 + 0.3Xw, y6 + u/2) ;
z8 = (x7 + 0.3Xw, y7  ) ;
paths[0] = z0{dir 80} ..z1..z2;
paths[1] = z3{dir -80}..z4..z5;
paths[2]:= z6{dir 20}..z7.. z8;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated -20)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated -20)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[2])(strokes[2]);

endglyph;
