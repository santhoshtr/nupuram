input glyph;
beginglyph;

z0=(3u, 0.6m);
z1=(x0 + 0.3mw, y0 + 0.4m);
z2=(x1 + 0.3mw, y1 - 0.5m);
z3=(x2 - 0.3mw, y2 - 0.5m);
z4=(x3 - 0.3mw, y3 + 0.4m);
z5=(x4 - 0.2mw, y4 - 0.4m);
z6=(x5 - 0.2mw, y5 + 0.2m);
z7=(x6 + 0.2mw, y6 + 0.3m);
z8=(x7 + mw*0.9, y7  );
z9=(x8 + 0.2mw, y8 - 0.3m);
z10=(x9 - 0.2mw, y9 - 0.2m);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7..tension 1.5..z8..z9..z10 ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2, 4, 6, 9)
    nib(default_nib xyscaled(1,terminalround) rotated 45)(4) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 115)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

z11 = z10;
z12 = (x11 + mw/4, y11 - m/5);
z13 = (x12 - mw/2, y12 - m/5);
z14 = (x13 - mw/2, y13);
z15 = (x14 - mw/2, y14 +  0.8m);
z16 = (x15 + m/4, y1 );
paths[2] = z11{right}..z12..z13---z14 ..z15.. {dir 60}z16;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,4)
    nib(default_nib xyscaled(xthick,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 135)(infinity) % Sharp cut
)(paths[2])(strokes[2]);
endglyph;
