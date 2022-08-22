input glyph;
beginglyph;
z0=(x1+mw/3, 0);
z1=(0, y0 + m/2);
z2=(x1 + mw/2, y1 + m/2);
z3=(x2 + mw/2, y2 - m/2);
z4=(x3 - mw/4, y3 - m/2);
z5=(x4 - mw/3, y4 + m/2);
z6=(x5 + mw/4, .9m);
z7=( x5, ascent + .1m);

paths[0] = z0..z1..z2..z3..z4..z5..z6{dir 60}..z7;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4)
    nib(thinnib rotated 0 )(1, 3, 5, 6)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
endglyph;
