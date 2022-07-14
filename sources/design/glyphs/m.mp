input glyph;
beginglyph;

z0=(0, s);
z1=(x0, y0 - 0.6s);
z2=(x1, 0);

z3= z1;
z4=(x3 + s/2, y0);
z5=(x4 + s/4, y4-s/2);
z6=(x5, y2);


z7= z5;
z8=(x7 + s/2, y0);
z9=(x8 + s/4, y8-s/2);
z10=(x9, y2);



paths[0] = z0{dir -60}..z1..z2;
paths[1] = z3{dir 80}..{dir 20}z4..z5..{dir -60}z6;
paths[2] = z7{dir 80}..{dir 20}z8..z9..{dir -60}z10;

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(0,2)
)(paths[0])(strokes[0]);

pen_stroke(

    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2 )
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(0)
    nib(default_nib xyscaled(1,terminalround) rotated 0)(infinity)
)(paths[2])(strokes[2]);

endglyph;
