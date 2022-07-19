input glyph;
beginglyph;
path paths[],strokes;

z0 = (u, 0.3m);
z1 = (x0  + 0.2mw, y0 + m/4 );
z2 = (x1 + mw/4, y1 - 0.2m);
z3 = (x2 - mw/4, y2 - 0.2m);
z4 = (x3 - mw/3, y3 + 0.4m);
z5 = (x4 + mw/2, y4 + 0.4m);
z6 = (x5 + mw/2, y5 - m/2);
z7 = (x6 - mw/3, y6 - m/2);
z8 = (x7 - mw/2, y7 - m/4 );

z12 = (x8, y8  );
z13 = (x12 + 0.6mw, y12 - 0.05m);
z14 = (x13 + 0.4mw, y12);
paths[0] = z0{up} .. z1..  z2..{left}z3 ;
paths[1] = z3{left}..z4 .. z5.. z6 ..z7..{dir 200}z8;
paths[2]:= z12{dir 20}..z13{dir -20}..z14;
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
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1 )
    nib(default_nib xyscaled(xthick*xthick, terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick*xthick, terminalround) rotated 115)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
