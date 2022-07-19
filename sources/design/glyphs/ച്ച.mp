input glyph;
beginglyph;
path paths[], strokes;


% Extra arch at begining
z10 = (m/6, m/3);
z11 = (x10 + m/5, y10 + m/2);
z12 = (x11 + mw/4, y11 - m/3);

paths[0] = z10{dir 120} ..z11.. {down}z12 ;
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(1,terminalround) rotated 45)(0) % Sharp cut
    nib(default_nib xyscaled(thin,terminalround) rotated 0)(infinity) % Sharp cut
)(paths[0])(strokes[0]);

z0=(x12, m/3);
z1=(x0, y0 + 0.2m);
z2=(x1 + 0.2mw, y1 + 0.2m);
z3=(x2 + 0.2mw, y2 - 0.2m);
z4=(x0, 0);
z5=(x4 - 0.6mw, 0);
z6=(x5 + 1.3mw, y5);
z7=(x6, y6 + m*0.5);
z8=(x7, y7 + m*0.5);

paths[1] = z0{up}..z1..{right}z2..z3 .. z4;
paths[2] := z5{dir 30}..{dir30}z6{dir 30}..z7...{dir 60}z8;

pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2, 4, 5, 6 )
    nib(default_nib xyscaled(thin, 1) rotated 0 )(1,3)
    nib(default_nib xyscaled(xthick,terminalround) rotated 0)(0) % Sharp cut
    nib(default_nib xyscaled(1,terminalround) rotated 150)(infinity) % Sharp cut
)(paths[1])(strokes[1]);
pen_stroke(
    nib(default_nib xyscaled(1, 1) rotated 0 )( 1, 3)
    nib(default_nib xyscaled(thin, thin) rotated 0 )(2)
    nib(default_nib xyscaled(xthick,terminalround) rotated 115)(0) % Sharp cut
    nib(default_nib xyscaled(xthick,terminalround) rotated 170)(infinity) % Sharp cut
)(paths[2])(strokes[2]);


endglyph;
