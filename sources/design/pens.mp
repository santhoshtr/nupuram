% ------ Stroke pens ---------
% Their angle remains constant through out the stroke, hence
% results modulated, ribbon like outlines. SVG will have only strokes. No paths

pen ellipsenib; ellipsenib := pencircle scaled thick yscaled thin rotated rotation;
pen sub_ellipsenib; sub_ellipsenib := pencircle scaled subthick yscaled thin rotated rotation;
pen finenib; finenib := pencircle scaled 1;

% -------- Path pens -----------
% Create an ellipse from 32 step polygon instead of circle so that we get
% a) Rounded terminals depending on thick, thin values
% b) The svg has paths and not strokes
numeric L; L:=16;
path penpath;
path sub_penpath;
penpath:=( (thick*cosd(0),thin*u*sind(0)) for i=1 upto L-1: -- (thick*cosd(i/L*360), thin*u*sind(i/L*360)) endfor -- cycle ) rotated rotation;
sub_penpath:=( (subthick*cosd(0),thin*u*sind(0)) for i=1 upto L-1: -- (subthick*cosd(i/L*360), thin*u*sind(i/L*360)) endfor -- cycle ) rotated rotation;
pen roundedwidenib ; roundedwidenib := makepen(penpath) ;
pen sub_roundedwidenib ; sub_roundedwidenib := makepen(sub_penpath) ;

% This is a wide nib pen with 0 thickness
% a) Sharp line terminals
% b) 0 width at rotation angles
% c) The svg has paths and not strokes
pen widenib ; widenib := makepen ((0,0)--(thick,0) rotated 45) ;

default_nib:=fix_nib(thick,thick,0);