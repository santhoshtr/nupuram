input glyph;
beginglyph;
z0=(m/4 + thick/2, m);
z1=(x0 - mw/4, y0 - m/2);
z2=(x1 + mw/4, y1 - m/2);
z3=(x2 + mw/4, y2 + 0.5m);
z4=(x3 + mw/4, y3 + 0.4m);
z5=(x4 + mw/2, y4 - 0.6m);
z6=(x5 - mw/4, y5 - 0.3m);
z7=(x6 - mw/4, y6 + 0.3m);
z8=(x7 + mw/4, y7 + 0.3m);
z9=(x8 + mw/4, y5 );

paths[0] = z0..{down}z1{down} ..{dir -2}z2{dir 2} ..z3..z4..z5{down}..{left}z6{left}..{up}z7{up}..{right}z8.. {down}z9 ;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 6, 8 )
    nib(thinnib rotated 0 )(1,3,5,7, 9)
    nib(terminalnib rotated 135)(0)
    nib(terminalnib rotated 60)(infinity)
)(paths[0])(strokes[0]);
endglyph;
