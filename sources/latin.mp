% This file contains reusable, common glyph shapes for Latin script
% for the current font.
% Copyright 2022 Santhosh Thottingal
% Licensed under MIT License

latin_loop_slant := tand(12);

vardef base_loop =
    z0 = (0, s/2);
    z1 = (x0 + sw/3, s );
    z2 = (x1 + sw/3,  y1 - s/2 );
    z3 = (x2 - sw/3,  0);
    z4 = (x2 - thick/4, 0);
    z0..z1..z2..z3..cycle
enddef;

vardef l_vstem =
    clearxy;
    path stem;
    z0=(0,X);
    z1=(x0 + thick/2,X/2);
    z2=(x1,0);
    stem:=z0{dir -60}..{down}z1{down}..z2;
    stem
enddef;

vardef p_vstem =
    clearxy;
    path stem;
    z0=(0,s);
    z1=(x0 + thick/2,s - X/2);
    z2=(x1,s-X);
    stem:=z0{dir -60}..{down}z1{down}..z2;
    stem
enddef;

vardef r_vstem =
    clearxy;
    path stem;
    z0=(0,s);
    z1=(x0 + thick/2,s/2);
    z2=(x1,0);
    stem:=z0{dir -60}..{down}z1{down}..z2;
    stem
enddef;

vardef n_arch =
    clearxy;
    path n;
    n:= base_loop;
    n:=n slanted latin_loop_slant;
    n:=n shifted (-latin_loop_slant*s/2, 0);
    n:= n cutafter point 1.8 of n;
    n:= n..z4;
    n
enddef;

vardef u_arch =
    reverse n_arch xyscaled(-1, -1) shifted(2/3s + thick/2, s)
enddef;

vardef r_arch =
    clearxy;
    n_arch cutafter point 1 of n_arch
enddef;

vardef p_loop =
    clearxy;
    path p;
    p:= base_loop;
    p:= p slanted latin_loop_slant;
    p:= p shifted (-latin_loop_slant*s/2, 0);
    p:= p cutbefore point .05 of p;
    p:= p cutafter point 3.6 of p;
    p
enddef;

vardef a_loop =
    clearxy;
    p_loop xyscaled(-1,-1) shifted(xpart(point 2 of p_loop), s)
enddef;

vardef e_loop =
    clearxy;
    path e;
    slant:= .16;
    z3 = (2sw/3, s/2);
    z4 = (x3 - sw/3, s );
    z5 = (x4 - sw/3,  y4 - s/2 );
    z6 = (x5+sw/3,  0 );
    z7 = (x6+sw/2, s/2 );
    e = z3..z4..z5..z6..z7;
    e:=e slanted latin_loop_slant;
    e:=e shifted (-latin_loop_slant*s/2 , 0);
    e:=e cutbefore point .4 of e;
    e:=e cutafter point 3.6 of e;
    e:=point 2 of e{dir -30}..e;
    e
enddef;

vardef c_loop =
    clearxy;
    path c;
    z3 = (2sw/3, s/2);
    z4 = (x3 - sw/3, s );
    z5 = (x4 - sw/3,  y4 - s/2 );
    z6 = (x5 + sw/3,  0 );
    z7 = (x6 + sw/2, s/2 );
    c = z3..z4..z5..z6..z7;
    c:=c slanted latin_loop_slant;
    c:=c shifted (-latin_loop_slant*sw/2, 0);
    c:=c cutbefore point .4 of c;
    c:=c cutafter point 3.6 of c;
    c
enddef;
