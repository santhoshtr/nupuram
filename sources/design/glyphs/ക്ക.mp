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
z8=(x7 + mw, y7  );
z9=(x8 + m/3 , y8 - 0.3m);
z10=(x9 - m/4 , y9 - 0.2m);
z11=(x10 - m/4 , y10 + m/2);
z12=(x11 + m/2 , y11 + m/2);
z13=(x12 + m/2 , y12 - m/2);
z14=(x13 - m/4 , y13 - m/2);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7..tension 1.5..z8..z9..z10..z11..z12..z13..z14 ;


pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2, 4, 6, 9,11,13)
    nib(default_nib xyscaled(1,terminalround) rotated 45)(4) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity) % Sharp cut
)(paths[0])(strokes[0]);
endglyph;
