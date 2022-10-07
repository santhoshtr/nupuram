% ------ Stroke pens ---------
% Their angle remains constant through out the stroke, hence
% results modulated, ribbon like outlines. SVG will have only strokes. No paths

pen ellipsenib; ellipsenib := pencircle scaled thick yscaled thin rotated rotation;
pen sub_ellipsenib; sub_ellipsenib := pencircle scaled subthick yscaled thin rotated rotation;
pen finenib; finenib := pencircle scaled 1;

% -------- Path pens -----------
% This is a wide nib pen with 0 thickness
% a) Sharp line terminals
% b) The svg has paths and not strokes
pen calligraphicpen ;
calligraphicpen := makepen ((0,0)--(thick, 0) rotated rotation) ;

default_nib:=fix_nib(thick,thick,0);