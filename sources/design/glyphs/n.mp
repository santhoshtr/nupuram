input glyph;
beginglyph;

z0=(0, s);
z1=(x0, y0 - 0.6s);
z2=(x1, 0);

z3= z1;
z4=(x3 + s/3, y0);
z5=(x4 + s/3, y4-s/2);
z6=(x5, y2);

paths[0] = z0{dir -60}..z1..z2;
paths[1] = z3{dir 80}..{dir 20}z4..z5..{dir -60}z6;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(0,2)
)(paths[0])(strokes[0]);

pen_stroke(

    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(infinity)
)(paths[1])(strokes[1]);
endglyph;
