input glyph;
beginglyph;
path paths[],strokes;
donotsoften:=1;
z0 = (u, 0.3m);
z1 = (x0  + 0.2m, y0 + 0.25m );
z2 = (x1 + m/4, y1 - 0.2m);
z3 = (x2 - m/4, y2 - 0.2m);
z4 = (x3 - m/3, y3 + 0.3m);
z5 = (x4 + 0.5m, y4 + 0.5m);
z6 = (x5 + 0.4m, y5 - 0.25m);
z7 = (x6 - 0.25m, y6 - 0.25m);
z8 = (x7 + 0.3m, y7 - 0.2m);
z9 = (x8 - 0.3m, y8 - 0.3m);
z10 = (x9 - 0.6m, y9 - 0.1m  );
z12 = (x10, y10 );
z13 = (x12 + 0.6m, y12 - 0.05m);
z14 = (x13 + 0.4m, y12);
paths[0] = z0{up} .. z1..  z2.. z3;
paths[1] = z3 ..z4.. z5.. z6..z7;
paths[2] = z7..z8..z9..{dir 200}z10;
paths[3] = z12{dir 20}..z13{dir -20}..z14;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(thin, terminalround) rotated 115)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0,4)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick, terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(thin, terminalround) rotated 115)(infinity) % Sharp cut
)(paths[2])(strokes[2]);

pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1 )
    nib(default_nib xyscaled(xthick*xthick, terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick*xthick, terminalround) rotated 115)(infinity) % Sharp cut
)(paths[3])(strokes[3]);
endglyph;
