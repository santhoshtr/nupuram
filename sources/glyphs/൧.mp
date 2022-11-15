input glyph;
beginglyph;
z11=(thick/2, - m/3);
z12=(x11 + mw/4, y11 + m/3);
z13=(x12 + 3/4mw, y12);
z14=(x13 + thick, y13 + m/2);
z15=(x14 - mw/3, m);
z16=(x15 - mw/3, y15 - m/2);
z17=(x16, y12);

paths[0] = z11{up}..z12{dir 20} .. z13{dir 20}..z14  .. z15..z16.. z17;
pen_stroke(
    nib(thicknib)(2,4,6)
    nib(thinnib)(1,3,5)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

endglyph;
