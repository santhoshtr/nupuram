input glyph;
beginglyph;

z0=(mw/2, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - m/2);
z3=(x2 - mw/3, y2 - m/2);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + m/3);
z8=(x7 + mw, y7  );
z9=(x8 + mw/3, y8 - m/3);
z10=(x9 - mw/2, y9 - 0.66m);
z11=(x10 - mw/3, -descent);
z12=(x11 + mw/3, y13 + m/5);
z13=(x12 + mw/3, -descent);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7..tension 1.5..z8..z9 ..z10{dir 190} ..z11{up}..z12{right}..z13;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4, 6, 9, 12, 13)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
endglyph;
