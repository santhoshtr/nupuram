input glyph;
beginglyph;
    path paths[], strokes;
    z0=( m/3, m);
    z1=(x0 -  m/3, y0 - m/2);
    z2=(x1 +  m/3, y1 - m/2);
    z3=(x2 +  m/3, y2+ m/2);
    z4=(x3, y3+m/3); % bottom of piller
    z5=(x3, y3);
    z6=(x5 +  m/3, y5 - m/2); % Top of second arch
    z7=(x6 +  m/3, y6 + m/2);
    z8=(x7 -  m/3, y7 + m/2);

    paths[0] = z0..z1..{right}z2.. z3---z4;
    paths[1] = z4---z5..z6..z7..z8;
    pen_stroke(
        nib(thicknib rotated 0 )(0, 2)
        nib(thinnib rotated 0 )(1, 3)
        nib(terminalnib rotated 135)(0)
        nib(terminalnib rotated 0)(4 )
    )(paths[0])(strokes[0]);
    pen_stroke(
        nib(thicknib rotated 0 )(0, 2, 4, 6)
        nib(thinnib rotated 0 )(1, 3, 5, 7)
        nib(terminalnib rotated 0)(0)
        nib(terminalnib rotated 45)(infinity)
    )(paths[1])(strokes[1]);
endglyph;
