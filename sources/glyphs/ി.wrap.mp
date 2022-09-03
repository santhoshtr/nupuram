input glyph;
beginglyph;
z0=(0, m+m/3);
z1=(x0 + mw/3, y0 + m/3 );
z2=(x1 + mw/3, y1 - 0.2m);
z3=(x2 + mw/12, y2 - 0.5m);
z4=(x1 + mw/6, 0);

paths[0] = z0{up} ..z1{right}.. z2..z3.. z4;
paths[0] := paths[0] shifted (-x2 + thick/2,0);

pen_stroke(
    nib(thicknib rotated 0 )(0,1,)
    nib(thinnib rotated 0 )(2,3)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
rbearing:=thick/2;
endglyph;
