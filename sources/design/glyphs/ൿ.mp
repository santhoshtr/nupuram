input glyph;
beginglyph;

z0=(0.4mw, 0.6m);
z1=(x0 + 0.3mw, y0 + 0.4m);
z2=(x1 + 0.3mw, y1 - 0.5m);
z3=(x2 - 0.3mw, y2 - 0.5m);
z4=(x3 - 0.3mw, y3 + 0.4m);
z5=(x4 - 0.2mw, y4 - 0.4m);
z6=(x5 - 0.2mw, y5 + 0.2m);
z7=(x6 + 0.2mw, y6 + 0.3m);
z8=(x7 + mw*0.9, y7  );
z9=(x8 + mw/2, y8 - m/4);
z10=(x9 - mw/4, y9 - m/4);
z11=(x10 - mw/4, y10 + m/3);
z12=(x11 + mw/4, y1);
z13=(x12 - mw/3, y12+m/4);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7..tension 2..z8..z9..z10..z11 .. {up}z12..z13;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2, 4, 6, 9,11,12)
    nib(default_nib xyscaled(1,terminalround) rotated 45)(4) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 90)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
