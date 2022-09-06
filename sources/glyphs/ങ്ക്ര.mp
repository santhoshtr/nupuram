input glyph;
beginglyph;
z0=(0.7mw, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - 0.5m);
z3=(x2 - mw/3, y2 - 0.5m);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + 0.3m);
z8=(x7 + mw, y7  );
z9=(x8 + 0.2mw, y8 - 0.3m);
z10=(x3, -descent-thick);
z11=(x6 - mw/2, m/3);
z12=(x11 + mw/4, m);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7 .. z8..z9..z10..z11{up}..z12 ;
paths[0] := paths[0] shifted(mw/4, 0);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4, 6, 9,11)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);


clearxy;
z0 = (xpart(point 6 of paths[0]), m/2);
z1 = (x0+ mw/4, m);
z2 = point 0 of paths[0];
paths[1] := z0{dir 110}.. z1..{down}z2;
pen_stroke(
    nib(thicknib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(thinterminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", z2);

endglyph;
