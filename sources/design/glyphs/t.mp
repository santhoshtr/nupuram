input glyph;
beginglyph;
path paths[], strokes;
z0=(0.15X, X);
z1=(x0, y0-0.6666X);
z2=(x1 + 0.4sw, thick/4);
%bar
z4 = (x0-0.25sw, s);
z5 = (x4 + 0.5sw, y4);
paths[0] = z0..tension 4..z1{down}..{dir 20}z2;
paths[1] = z4{dir 20}..{dir 20}z5;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0  )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
endglyph;
