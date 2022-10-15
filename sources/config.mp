% This file is the base configuration for the font
% Variant configuration overrides the config variables defined here.
% Copyright 2022 Santhosh Thottingal
% Licensed under MIT License

em :=           1024;         % Height of characters - Em square
u :=            em/10;        % Unit width. Em square divisions. This is the base for all strokes

ascent  :=      8u;           % Ascender Height
descent :=      2u;           % Descender Height
xheight :=      2/3*ascent;   % Height of English small letters
mheight :=      3/4*ascent;   % Height of Malayalam letters
Xheight :=      8u;           % Height of English capital letters

rotation :=     45;           % Angle of calligraphic pen
thick :=        1u;           % Thickness of thickest lines
thin :=         0.7;          % Thickness of thinnest lines (same as thick when no modulation)
subthick :=     0.666u;       % Thickness of thickest lines in subscribed characters
xthick :=       1;            % Extra thickness for terminals
slant :=        0;            % Slant of characters.Give angle values
condense :=     1;            % Condense factor. Less than for condense, Greater than one for expand
lbearing :=     0.4u;         % Default left bearing
rbearing :=     0.4u;         % Default right bearing

linecap :=      butt;         % butt or rounded or square
linejoin :=     rounded;      % rounded or mitered or beveled
soften :=       1;            % Whether sharp corners need to be softened using cornerradius
cornerradius := 10;           % Corner radius. Used when soften=1.
terminalround:= 0.56;         % Terminal roundness. Give 1 for round terminals. 0 for razor cuts

outputformat := "svg";        % Output format

varstroke :=     1;           % Stroke modulation. Uses pen_strokes


color glyphcolor; glyphcolor := (.1, .37,.71);
color debugcolor; debugcolor := (.90, .38,.0);
color gridcolor; gridcolor := (.47, .46,.48);
color arrowcolor; arrowcolor := (.90, .38,.0);

% Configurations for debug(development) mode.
showgrids := 0;
showcoords := 0;
show_arrows := 0; % Set to 1 to draw arrow showing drawing path
show_paths := 0;
show_dots := 0;

