em :=           1000;         % Height of characters - Em square
u :=            em/10;        % Unit width. Em square divisions. This is the base for all strokes

xheight :=      5u;           % Height of English small letters
mheight :=      6u;      % Height of Malayalam letters
descent :=      2u;           % Descender Height
ascent  :=      8u;   % Ascender Height
Xheight :=      8u;           % Height of English capital letters

rotation :=     45;           % Angle of pen
thick :=        1u;           % Thickness of thickest lines
thin :=         2/3;          % Thickness of thinnest lines (same as thick when no modulation)
subthick :=     0.666u;       % Thickness of thickest lines in subscribed characters
xthick :=       1;            % Extra thickness for terminals
slant :=        tand(0);      % Slant of characters. A value like 0.2 will give forward slant. Negative values give backward slant
condense :=     1;            % Condense factor. Less than for condense, Greater than one for expand
lbearing :=     0.25u;         % Default left bearing
rbearing :=     0.25u;         % Default right bearing

outline :=      0;            % Whether font is outline font or not. 1 means outline. This will not work with strokepens

linecap :=      butt;         % butt or rounded or square
linejoin :=     rounded;      % rounded or mitered or beveled

outputformat :=   "svg";

varstroke := 1;


color glyphcolor; glyphcolor := (.1, .37,.71);
color debugcolor; debugcolor := (.90, .38,.0);
color gridcolor; gridcolor := (.47, .46,.48);
color arrowcolor; arrowcolor := (.90, .38,.0);

debug := 0; % Set to 1 to draw coordinates and direction arrows in images.
show_arrows := 0; % Set to 1 to draw arrow showing drawing path
show_paths := 0;

