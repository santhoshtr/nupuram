input glyph;
beginglyph;
save r;
r=0.8;
z0=(0.9*sw*r, 0.8s);
z1=(0.4sw*r,s-thick/4);
z2=(0, s/3);
z3=( 0.4*sw*r, thick/4 );
z4= (sw*r, s/4);

paths[0] = z0{dir 120}..z1{dir 195}.. z2{dir -75}..z3 ..{dir 60}z4;
paths[0] := paths[0] shifted (sw/3, s/3) xscaled 0.8 yscaled 0.85;
pen_stroke(
    nib(thicknib rotated 0 )(1,3)
    nib(thinnib rotated 0 )(2,4)
    nib(terminalnib rotated terminalangle 0 of paths[0])(0)
    nib(terminalnib rotated terminalangle infinity of paths[0])(infinity)
)(paths[0])(strokes[0]);
soften := 0;
clearxy;
z0=(0, X/2 );
z1=(x0 + 0.4Xw, y0 + 0.5X - thick/4);
z2=(x1 + 0.4Xw, y0);
z3=(x1, thick/4);
z4=(x0, y2);

paths[1] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4 ;

pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0,2, 4)
)(paths[1])(strokes[1]);
endglyph;
