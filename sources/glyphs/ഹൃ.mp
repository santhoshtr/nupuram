input glyph;
beginglyph;
z0=(mw/6, -thick/4);
z1=(0, y0 + m/3);
z2=(x0 + mw/6, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x2, 0);
z5=(x4, 0);
z6=(x5 + 0.6mw, y5);
z7=(x6 - 0.2mw, y6 + m*0.5);
z8=(x7 + 0.4mw, y7 + m*0.5);
z9=(x8 + 0.4mw, y8- m*0.5);
z10=(x9-0.3mw, y9 - m*0.8);
z11=(x10 - 0.6mw, y10);
z12=(x11 + 0.3mw, y11 + 0.18m);
z13=(x12 + 0.3mw, y10);

paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] := z5{dir 30}..{dir30}z6{dir 120}..{up}z7{up}..{right}z8{right}..z9{down}.. z10..z11..z12..{dir -45}z13;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 45)(0)
    nib(terminalnib rotated 120)(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3, 5, 7)
    nib(thinnib rotated 0 )(2, 4, 6, 8)
    nib(terminalnib rotated 115)(0)
)(paths[1])(strokes[1]);
endglyph;
