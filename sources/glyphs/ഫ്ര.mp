input glyph;
beginglyph;
z0=(x1 + mw/6, 0);
z1=(mw/3, y0 + m/3);
z2=(x0 + mw/6, y1 + m/4);
z3=(x2 + mw/4, y2 - m/4);
z4=(x3 - mw/5, 0);
z5=(x4, 0);
z6=(x5 + mw, y5);
z7=(x6+0.2mw, y6 + m/2);
z8=(x7-mw/3, y7 + m/2);
z9=(x8-mw/3, y8 - m/2);
z10=(x9, y5);

paths[0] = z0{dir 135}..z1..{right}z2..z3{dir 260}..z4;
paths[1] := z5{dir 30}..z6..z7..z8..z9.. {dir -85}z10;
z11 = point 2 of paths[1];
z12 = (x11 - 0.4mw, -descent - thick/2  );
z13 = (x2, -descent - thick/4);
z14 = (x1 - mw/3, y1);
z15 = (x14 + 0.2mw, m);


paths[2] = z11{down} ..{left}z12 ..z13 ..z14..z15;
pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2,4)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity)
)(paths[1])(strokes[1]);

pen_stroke(
    nib(thicknib rotated 0 )( 2)
    nib(thinnib rotated 0 )(0, 3)
    nib(thinterminalnib rotated terminalangle 0 of paths[2])(0)
    nib(terminalnib rotated terminalangle infinity of paths[2])(infinity)
)(paths[2])(strokes[2]);

anchor( "vc", (x9,0));
anchor( "right", (point .8 of paths[2]));
endglyph;
