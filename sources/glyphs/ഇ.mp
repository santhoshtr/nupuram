input glyph;
beginglyph;
path paths[],strokes;

z0 = (u, 0.3m);
z1 = (x0  + 0.2mw, y0 + 0.25m );
z2 = (x1 + mw/4, y1 - 0.2m);
z3 = (x2 - mw/4, y2 - 0.2m);
z4 = (x3 - m/3, y3 + 0.4m);
z5 = (x4 + 0.35mw,  m);
z6 = (x5 + 0.4mw, y5 - 0.6m);
z7 = (x6, y6 - .2m);
z8 = (x6, y6);
z9 = (x8 + 0.35mw, m);
z10 = (x9 + 0.35mw, y9 - 0.5m);
z11 = (x10 - 0.6mw, y10 - 0.5m); % <

z12 = (x11 - 0.6mw, y11 - 0.2m);
z13 = (x12 + 0.6mw, y12 - 0.05m);
z14 = (x13 + 0.6mw, y12);
paths[0] = z0{up} .. z1..  z2..{left}z3 ;
paths[1] = z3{left}..z4{up}..{right}z5..{down}z6..z7;

paths[2]:= z8{up}..z9{right}.. z10 ..z11..{dir 220}z12;
paths[2]:= paths[2] slanted tand(10);
paths[2]:= paths[2] shifted (-tand(10)*mw/3, 0);
paths[3]:= (point 4 of paths[2]){dir 20}..z13{dir -20}..z14;
pen_stroke(
    nib(thicknib rotated 0 )(1, 3 )
    nib(thinnib rotated 0 )(0, 2 )
)(paths[0])(strokes[0]);
pen_stroke(
    nib(thicknib rotated 0 )(0,4)
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 10)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )(1, 3)
    nib(thinnib rotated 0 )(0,2,4 )
    nib(thinterminalnib rotated 135)(0)
    nib(terminalnib rotated 115)(4)
)(paths[2])(strokes[2]);
pen_stroke(
    nib(thinnib rotated 0 )(1 )
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 115)(infinity)
)(paths[3])(strokes[3]);
endglyph;
