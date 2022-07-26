input glyph;
beginglyph;
path paths[], strokes;


% Extra arch at begining
z10 = (m/6, m/3);
z11 = (x10, y10 + m/4);
z12 = (x11 + m/5, y11 + m/3);
z13 = (x12 + mw/4, y12 - m/2);

paths[0] = z10{dir 80} ..z11  ..z12{dir -10}.. {down}z13 ;
pen_stroke(
    nib(thicknib rotated 0 )( 2, 4)
    nib(thinnib rotated 0 )(1)
    nib(terminalnib rotated 0)(0)
    nib(thinterminalnib rotated 0)(infinity)
)(paths[0])(strokes[0]);

z0=(x13, m/3);
z1=(x0, y0 + 0.2m);
z2=(x1 + 0.2mw, y1 + 0.2m);
z3=(x2 + 0.2mw, y2 - 0.2m);
z4=(x0, 0);
z5=(x4 - 0.6mw, 0);
z6=(x5 + 1.3mw, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.5);

paths[1] = z0{dir 95}..z1..{right}z2..z3 .. z4;
paths[2] := z5{dir 30}..{dir30}z6{dir 30}..z7...{dir 60}z8;

pen_stroke(
    nib(thicknib rotated 0 )(0, 2, 4, 5, 6 )
    nib(thinnib rotated 0 )(1,3)
    nib(terminalnib rotated 0)(0)
    nib(terminalnib rotated 150)(infinity)
)(paths[1])(strokes[1]);
pen_stroke(
    nib(thicknib rotated 0 )( 1, 3)
    nib(thinnib rotated 0 )(2)
    nib(terminalnib rotated 115)(0)
    nib(terminalnib rotated 170)(infinity)
)(paths[2])(strokes[2]);


anchor( "vc", z3);
anchor( "bottom", z6);
anchor( "right", z6);
endglyph;
