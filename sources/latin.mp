% This file contains reusable, common glyph shapes for Latin script
% for the current font.
% Copyright 2022 Santhosh Thottingal
% Licensed under MIT License

latin_loop_slant := tand(8);

vardef base_loop =
    z0 = (0, s/2);
    z1 = (x0 + sw/3, s - thick/4 );
    z2 = (x1 + sw/3, y1 - s/2 );
    z3 = (x2 - sw/3, thick/4);
    z0..z1..z2..z3..cycle
enddef;

vardef l_vstem =
    clearxy;
    path stem;
    z0=(0,X);
    z1=(x0 + thick/2,X/2);
    z2=(x1,0);
    z0{dir -60}..{down}z1{down}..{dir -60}z2
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
    save r;
    r=0.8;
    z0=(0, 0);
    z1=(r*sw/6, 0.6s);
    z2=(r*sw, s - thick/4);
    z3=(x2, s/2);
    z4=(x3+0.1sw*r, 0);
    z0{dir 90}.. z1{dir 60}..{dir -45}z2{dir -60}..  z3..{dir -60}z4
enddef;

vardef u_arch =
    reverse n_arch xyscaled(-1, -1) shifted(2/3s + thick, s)
enddef;

vardef r_arch =
    clearxy;
    (n_arch cutafter point 2 of n_arch) xyscaled(0.8, 1)
enddef;

% For the loops of p and b
vardef p_loop =
    clearxy;
    path p;
    r=0.8;
    z0=(0, 0);
    z1=(r*2/3sw, s);
    z2=(r*sw, 2/3s);
    z3=(0.5*r*sw, 0);
    z4=(x0+r*sw/5, y0 + s/10);
    z0{dir 80}..z1..{dir -80}z2{dir -80}..{dir 190}z3 ..z4
enddef;

vardef a_loop =
    clearxy;
    save r;
    r=0.8;
    z0=(sw*r,  0.9s);
    z1=(0.5*sw*r, s);
    z2=(0, s/3);
    z3=(r*sw/3, 0);
    z4=(x0, y0);
    z0..z1{dir 190}..{dir -80}z2{dir -80}..z3 ..{dir 80}z4
enddef;

vardef e_loop =
    clearxy;
    save r,e;
    path e;
    r=0.8;
    z0=(sw*r, 0.8s);
    z1=(0.5sw*r,s);
    z2=(0, s/3);
    z3=( sw/3*r, 0);
    z4= (sw*r, s/5);
    z5 = z2;
    z5{right}..{dir 100}z0..z1{dir 200}..{dir -80}z2{dir -80}..z3 ..{dir 60}z4

enddef;

vardef c_loop =
    clearxy;
    save r,e;
    path e;
    r=0.8;
    z0=(sw*r, 0.8s);
    z1=(0.5sw*r,s);
    z2=(0, s/3);
    z3=( sw/3*r, 0);
    z4= (sw*r, s/5);

    z0..z1{dir 200}..{dir -80}z2{dir -80}..z3 ..{dir 60}z4
enddef;
