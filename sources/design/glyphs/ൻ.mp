input glyph;
beginglyph;
z0=(m/3+.5thick, 0);
z1=(x0 - m/3, y0 + m/2);
z2=(x1 + m/3, y1 + m/2);
z3=(x2 + m/3, y2 - m/2);
z4=(x3, y3 - m/3); % bottom of piller
z5=(x3, y3);
z6=(x5 + m/2.5, y5 + m/2); % Top of second arch
z7=(x6 + m/2.5, y6 - m/2);
z8=(x7 - mw/4, y7 - m/2.5);
z9=(x8 - mw/4, y8 + m/2);
z10=(x9 + m/3, y9 + m/2);
z11=(x10-m/3, y10 + 0.3m);

paths[0] = z0..z1..{right}z2.. z3---z4 ;
paths[1] = z5{up}..z6..z7..z8 .. z9..z10{up}..{left}z11;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
    nib(default_nib xyscaled(1,terminalround) rotated 45)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 10)(4 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2,4, 5)
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity)
)(paths[1])(strokes[1]);
endglyph;
