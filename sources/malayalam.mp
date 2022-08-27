% This file contains reusable, common glyph shapes for Malayalam script
% for the current font.
% Copyright 2022 Santhosh Thottingal
% Licensed under MIT License

% Anticlockwise loop
vardef ml_base_loop_ac =
    save hr, vr;
    hr = mw/3; % Horizontal radius
    vr = m/2; % Vertical radius
    z0 = (0, m - vr);
    z1 = (x0 + hr, y0 + vr );
    z2 = (x1 +  hr,  y0 );
    z3 = (x1,  y2 - vr);
    z0..z1..z2..z3..cycle
enddef;

% Clockwise loop
vardef ml_base_loop_c =
    clearxy;
    save hr, vr;
    right_sweep_corr := 1.2;
    hr = mw/3; % Horizontal radius
    vr = m/2; % Vertical radius
    z0 = (hr, 0);
    z1 = (x0 - hr, y0 + vr );
    z2 = (x1 +  hr*right_sweep_corr,  y1 + vr );
    z3 = (x2 + hr,  y2 - vr);
    z0..z1..z2 ..z3..z0
enddef;

% Clockwise loop
vardef ml_base_loop_short_c =
    clearxy;
    save hr, vr;
    hr = mw/3; % Horizontal radius
    vr = 0.9*m/2; % Vertical radius
    z0 = (hr, 0);
    z1 = (x0 - hr, y0 + vr );
    z2 = (x1 +  hr,  y1 + vr );
    z3 = (x2 + hr,  y2 - vr);
    z0{left}..z1{up}..z2{right}..z3{down}..{left}z0
enddef;

vardef left_arch =
    clearxy;
    save l,slant;
    path l;
    slant := tand(-8);
    l:= ml_base_loop_c;
    l:=l slanted slant;
    l:=l shifted (-slant*mw/2, 0);
    l
enddef;

vardef right_arch =
    clearxy;
    save l,slant;
    path l;
    slant:= tand(8);
    l:= ml_base_loop_c;
    l:=l slanted slant;
    l:=l shifted (-slant*m/2, 0);
    l
enddef;

vardef right_arch_short =
    clearxy;
    save l,slant;
    path l;
    slant:= tand(8);
    l:= ml_base_loop_short_c;
    l:=l slanted slant;
    l:=l shifted (-slant*m/2, 0);
    l
enddef;

% Clockwise top loop sits on top of mid horizontal line
vardef top_arch_c =
    clearxy;
    save l,hr,vr;
    path l;
    hr = mw/3 * 0.8; % Horizontal radius
    vr = m/4; % Vertical radius
    z0 = (mw/3*0.25, vr + m/2);
    z1 = (x0 + hr, y0 + vr );
    z2 = (x1 +  hr,  y1 - vr );
    z3 = (x2 - hr,  y2 - vr);

    z0{up}..{left}z1..{down}z2..{right}z3..{up}z0
enddef;

% Anti clockwise top loop sits on top of mid horizontal line
vardef top_arch_ac =
    clearxy;
    save l,hr,vr;
    path l;
    hr = mw/3 * 0.9; % Horizontal radius
    vr = m/4; % Vertical radius
    z0 = (2*mw/3, vr + m/2);
    z1 = (x0 - hr, y0 + vr );
    z2 = (x1  - hr,  y1 - vr );
    z3 = (x2 + hr,  y2 - vr);

    z0{up}..{left}z1..{down}z2..{right}z3..{up}z0
enddef;

% Clockwise
vardef bottom_arch =
    clearxy;
    save l,hr,vr;
    path l;
    hr = mw/3; % Horizontal radius
    vr = m/4; % Vertical radius
    z0 = (0, vr);
    z1 = (x0 + hr, y0 + vr );
    z2 = (x1 + hr,  y1 - vr );
    z3 = (x2 - hr,  y2 - vr);
    z0{up}..z1..z2..z3..{up}z0
enddef;

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
    z3=(thick/4, m/3);
    z4=(x3 + mw/3, 0);
    z5=(x4 + 2/3mw, y3);
    z6=(x5 - mw/8, y2);
    z0 ..z1.. z2..z3 .. z4 ..z5.. z6
enddef;

vardef ra =
   clearxy;
    z0=(x1 + mw/4 , 0);
    z1=(0, m/2);
    z2=(x0 + mw/3, y1 + m/2);
    z3=(x2 + mw/3, y2-m/2);
    z4=(x2, 0);
    z0{dir 135}..z1.. z2{right}..z3{dir 260}..z4
enddef;

vardef pa_mouth =
    clearxy;
    z0=(x1 + mw/8, 0);
    z1=(0,  m/3);
    z2=(x0 + mw/5, y1 + m/4);
    z3=(x2 + mw/4, y2 - m/4);
    z4=(x2, 0);
    z0{dir 135}..z1.. z2{right}..z3{dir 260}..z4
enddef;

vardef pa_tail =
    clearxy;
    z0=(0, 0);
    z1=(x0 + 0.8mw, y0);
    z2=(x1, y1 + m/2);
    z3=(x2, y2 + m/2);
    z0{dir 30}..{dir 30}z1{dir 30}..z2...{dir 60}z3
enddef;

vardef va_tail =
   clearxy;
   z0=(0, 0);
   z1=(x0 + 0.7mw, y0);
   z2= (x1, y1 + m/2);
   z3=(x2, y2 + m/2);
   z0{dir 20}..{dir 20}z1{dir 30}..z2...{dir 60}z3
enddef;

vardef da =
   clearxy;
    save p,loop_slant;
    path p;
    loop_slant=tand(8);
    z0 = (x1 + mw/8, 0);
    z1 = (0,  m/2);
    z2 = ( x1 + m/3, y1 + m/2);
    z3 = ( x2 + m/3, y2 - m/4);
    z4 = ( x3 - m/3, y3 - m/4);
    z5 = (x4 + mw/2, y4 - m/3);
    z6 = (x5 - mw/2, 0);

    p = z0..z1{up}..z2..z3..{left}z4{right}..z5 ..{dir 160}z6 ;
    p:=p slanted loop_slant;
    p:=p shifted (-loop_slant*m/2,0);
    p
enddef;

vardef left_arch_with_eye =
    clearxy;
    save p,loop_slant;
    path p;
    loop_slant=tand(-4);
    z0 =(x3, y3);
    z1=(x0 + mw/2, y3 - m/6 );
    z2=(x1 - mw/5,  thick/2);
    z3=(0, m/2);
    z4=(x3 + mw/3, m);
    z5=(x4 + mw/2, m/2);
    z6=(x5, m/6);
    p:=z0{dir 30} .. z1{down}..z2{left}..z3.. z4..{down}z5;
    p:=p slanted loop_slant;
    p:=p shifted (-loop_slant*m/2,0);
    p:=p{down} ---z6;
    p
enddef;