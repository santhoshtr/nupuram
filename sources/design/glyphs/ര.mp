input glyph;
beginglyph;
    path paths[], strokes;
    z0=(0.3m+.5thick, 0); % bottom of piller
    z1=(x0 - 0.3mw, y0 + 0.5m);
    z2=(x1 + 0.5mw, y1 + 0.5m); % Top of second arch
    z3=(x2 + 0.5mw, y2 - 0.5m);
    z4=(x3 - 0.3mw, y3 - 0.5m);
    z5=(x4 - mw/4, y4 + m/3);
    z6=(x5 + mw/2, y5 + m/3);

    paths[0] = z0..z1..z2..z3..z4..z5...z6 ;
    pen_stroke(
        nib(thicknib rotated 0 )(0, 2, 4)
        nib(thinnib rotated 0 )(1, 3, 5, 6)
        nib(terminalnib rotated 45)(0)
        nib(terminalnib rotated 90)(infinity)
    )(paths[0])(strokes[0]);



endglyph;
