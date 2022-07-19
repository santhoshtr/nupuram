input glyph;
beginglyph;
path paths[], strokes;
soften := 0;
z0=(thick/2, 0.5s);
z1=(x0 + 0.4sw, y0 + 0.5s);
z2=(x1 + 0.4sw, y1 - 0.5s);
z3=(x2 - 0.4sw, y2 - 0.5s);
z4=(x3 - 0.4sw, y3 + 0.5s);

paths[0] = z0{up}..{right}z1..{down}z2..z3{left}..{up}z4;
paths[0] := paths[0] crotated -10 shifted(thick/4, 0);

z5 = (x0, y1 +  thick/2);
z6 = (x5, y5 - s/2);
z7 = (x5, y6 - s/2);
z8 = (x0, y7 - s/2);
paths[1] = z5{dir 280}..z6.. z7..{dir 280}z8 ;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3 )
    nib(default_nib xyscaled(thin, thin) rotated 0 )(0,2, 4)
)(paths[0])(strokes[0]);
pen_stroke(
    nib(default_nib xyscaled(thin, thin) rotated 0 )(1,2 )
    nib(default_nib xyscaled(xthick, terminalround) rotated 0 )(0)
    nib(default_nib xyscaled(xthick, terminalround) rotated 0 )(infinity)
)(paths[1])(strokes[1]);
endglyph;
