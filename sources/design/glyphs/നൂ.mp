input glyph;
beginglyph;
    path paths[], strokes;
    z0=(2.5u, 0);
    z1=(x0 -2u, y0  + 0.5m);
    z2=(x1 + 1.5u, y1 + 0.4m);
    z3=(x2 + 2u, y2 - m*0.5);
    z4=(x3, 1u); % bottom of piller
    z5=(x3, y3);
    z6=(x5 + m/2, y5 + .6m); % Top of second arch
    z7=(x6 + m/3, y6 - m/2);
    z8= ( x7 - m/3, y7 - m/2);
    z9= ( x8 - m/4, y8 + .3m);
    z10= ( x9 + m/2, y9 +  m/3);
    z11= ( x10 + m/3, y10 - m/3 );
    z12= ( x11 - 0.7m, y11 - m/2 );
    paths[0] = z0..z1.. z2..z3---z4 ;
    paths[1] = z5{up}..z6..z7..z8..z9..z10..z11..z12;
    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(0, 2)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(1, 3)
        nib(default_nib xyscaled(xthick,terminalround) rotated 45)(0)
        nib(default_nib xyscaled(1,terminalround) rotated 0)(4 )
    )(paths[0])(strokes[0]);
    pen_stroke(
        nib(default_nib xyscaled(1, 1) rotated 0 )(1, 3, 5, 7)
        nib(default_nib xyscaled(thin, thin) rotated 0 )(0, 2, 4, 6)
        nib(default_nib xyscaled(thin,terminalround) rotated 0)(0)
        nib(default_nib xyscaled(xthick,terminalround) rotated 60)(infinity)
    )(paths[1])(strokes[1]);
endglyph;
