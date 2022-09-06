input glyph;
beginglyph;

paths[0] = pa_mouth shifted(0, m/3);
z5= point infinity of paths[0];
z6=(x5 + 0.6mw, y5);
z7=(x6+ mw/2,  y6 + m/6);
z8=(x7 - mw/3 , m);
z9=(x8 - mw/3 , m/3);
z10=(x9+ mw/3, 0);
z11=(x10 + 2/3mw , y6);
z12=(x11, m);

paths[1] := z5{dir 30}..z6..z7..z8..z9.. z10{dir -20}..z11..z12;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2,4,6)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

anchor( "vc", (x6,0));
anchor( "right", point 5.6 of paths[1]);

endglyph;
