input glyph;
beginglyph;
z0=(mw/8 + thick/2, 0.5m);
z1=(x0 - mw/8, y0 + m/4);
z2=(x1 + mw/4, y1 + m/5);
z3=(x2 + mw/3, y2 - m/2);
z4=(x3 - mw/4, y3 - 0.45m);
z5=(x4 - mw/3, y4 + m/4);
paths[0] = z0 .. z1.. z2 .. tension 1.25 ..z3 ..  z4 .. z5;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3 )
    nib(default_nib xyscaled(xthick,terminalround) rotated 60)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 30)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
