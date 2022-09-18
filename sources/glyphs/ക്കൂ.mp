input glyph;
beginglyph;

z0=(0.5mw, 0.6m);
z1=(x0 + mw/3, y0 + 0.4m);
z2=(x1 + mw/3, y1 - 0.5m);
z3=(x2 - mw/3, y2 - 0.5m);
z4=(x3 - mw/3, y3 + 0.4m);
z5=(x4 - mw/4, y4 - 0.4m);
z6=(x5 - mw/4, y5 + 0.2m);
z7=(x6 + mw/4, y6 + 0.3m);
z8=(x2 + mw/4, y7);
z9=(x8 + mw/4, y8 - 0.3m);
z10=(x9 - mw/4, 0);
z11=(x10 - mw/4, y10 + m/2);
z12=(x11 + mw/2, y11 + m/2);
z13=(x12 + mw/3, y12 - m/4);
z14=(x13 - mw/4, y13 - m/4);

paths[0] := z0{up}..{right}z1..{down}z2..z3{left}..{up}z4{down}..z5..z6..z7{dir 18} .. z8{dir -18}..z9..z10..z11..z12..z13 ..z14 ;


pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4, 6, 9,11,13)
    nib(thinterminalnib rotated terminalangle 0 of paths[0])(0)
    nib(thinterminalnib rotated terminalangle 4 of paths[0])(4)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);

z20 = z14;
z21 = (x20 + m/3, y20 - m/4);
z22 = (xpart (point 11 of paths[0]), -descent);

paths[1] = z20..z21..{dir 190}z22 ;

pen_stroke(
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);


% tail
clearxy;
z12 = point infinity of paths[1];
z13 = (xpart(point 12 of paths[0]), y12 );
z14 = (xpart(point 1 of paths[1]) + thick/2, y12);
paths[2] = z12{dir 20}..z13..{dir 20}z14;

pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);
anchor( "vc", (xpart(point 2 of paths[0]),0));
rbearing:=rbearing - thick;
endglyph;
