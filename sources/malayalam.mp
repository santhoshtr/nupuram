% This file contains reusable, common glyph shapes for Malayalam script
% for the current font.
% Copyright 2022 Santhosh Thottingal
% Licensed under MIT License

input glyph;

vardef la_sign =
    clearxy;
    z0=(0.2mw,  0);
    z1=(x0 + 0.2mw, y0 - m/4);
    z2=(x1 - 0.2mw, y1 - m/4);
    z3=(x2 - 0.2mw, y2 + m/4);
    z4=(x3 + 0.2mw, y3 + m/4);
    z5=(x4 + 0.3mw, y4 - m/4);
    z6=(x5 + 0.3mw, y5 - m/4);
    z7=(x6 + 0.2mw, y6 + m/4);
    z8=(x7 - 0.2mw, y7 + m/4);;
    z0...z1{down}...z2{left}..{up}z3..z4..z5..z6..z7..z8

enddef;

vardef la =
    clearxy;
    z0=(mw/4, m/2);
    z1=(x0 + mw/2, y0+m/6);
    z2=(x1 - mw/3, m);
    z3=(x2 - mw/3, m/3);
    z4=(x3 + mw/3, 0);
    z5=(x4 + 2/3mw, y3);
    z6=(x5 - mw/8, y2);
    z0 ..z1.. z2..z3 .. z4 ..z5.. z6
enddef;
