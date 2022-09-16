input glyph;
beginglyph;
z0=(0, 0.5X);
z1=(x0 + 0.4Xw, y0 + 0.5X);
z2=(x1 + 0.4Xw, y1 - 0.5X);
z3=(x2 - 0.4Xw, y2 - 0.5X);
z4=(x3 - 0.4Xw, y3 + 0.5X);
z6 =  (x1+0.1Xw, y0 - 0.2X);
z7 =  (x6+0.1Xw, y6 - 0.2X);
z8 =  (x7+0.1Xw, y7 - 0.2X);
paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;
paths[1] = z6{dir -80}..z7..{dir -80}z8 ;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2, 4)
    nib(terminalnib rotated terminalangle 0 of paths[1])(0)
    nib(terminalnib rotated terminalangle infinity of paths[1])(infinity) %
)(paths[1])(strokes[1]);
endglyph;
