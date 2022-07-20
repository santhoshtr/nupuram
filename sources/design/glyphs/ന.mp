input glyph;
beginglyph;
    path paths[], strokes;
    z0=(mw/3+.5thick, 0);
    z1=(x0 - mw/3, y0 + m/2);
    z2=(x1 + mw/3, y1 + m/2);
    z3=(x2 + mw/3, y2 - m/2);
    z4=(x3, y3 - m/3); % bottom of piller
    z5=(x3, y3);
    z6=(x5 + mw/3, y5 + m/2); % Top of second arch
    z7=(x6 + mw/3, y6 - m/2);
    z8=(x7 - mw/3, y7 - m/2);
    paths[0] = z0..z1.. z2.. z3---z4 ;
    paths[1] =  z5{up}..z6..z7.. z8;
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
        nib(default_nib xyscaled(xthick,terminalround) rotated 120)(infinity)
    )(paths[1])(strokes[1]);
endglyph;
