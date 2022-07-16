input glyph;
beginglyph;

z0=(m/3 + thick*0.5, 0.66m);
z1=(x0 + mw/4, y0 + m/6);
z2=(x1 - mw/4, y1 + m/6);
z3=(x2 - m/3, y2 - m/2);
z4=(x3 + m/3, y3 - m/2);
z5=(x4 + mw/4, y4 + m/6);
z6=(x5 - mw/2, y5 + m/6);

paths[0] = z0..z1..z2.. z3..z4..z5..{dir 210}z6 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3, 5)
    nib(default_nib xyscaled(1,terminalround) rotated 90)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 90)(infinity)
)(paths[0])(strokes[0]);

endglyph;
