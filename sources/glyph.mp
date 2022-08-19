% This file various utility functions for drawing a glyph
% Copyright 2022 Santhosh Thottingal
% Licensed under MIT License

% Macros from MetaType1
input plain_ex;
% Base configuration
input config;
% Customization for a font variant. If file does not exist, skips.
% jobname is an internal variable set by Makefile.
% The purpose of this variable is different, but Metapost allows setting
% values for internal variables only. So using jobname which is relatively
% better choice for possing current style variant name
maybeinput jobname;

% Pens
input ./pens

pen nib; nib := finenib; % roundedwidenib

phi := 1.618; % Golden ratio
% Aliases
m   := mheight;
s   := xheight;      % x is a special symbol. So let us use s
X   := Xheight;

sw  := s * condense; % Width of Latin small letters
mw  := m * condense; % Width of Malayalm letters
Xw  := X * condense; % Width of Latin capital letters
lbearing := lbearing * condense;
rbearing := rbearing * condense;

vardef thicknib = fix_nib(thick, thick, 0) enddef;
vardef thinnib = fix_nib(thick, thick, 0) xyscaled(thin, thin) enddef;
vardef terminalnib =
    if terminalround = 0:
        fix_nib(thick, 0, 0) xyscaled(xthick, terminalround)
    else:
        fix_nib(thick, thick, 0) xyscaled(xthick, terminalround)
    fi
enddef;

vardef thinterminalnib =
    if terminalround = 0:
        fix_nib(thick, 0, 0) xyscaled(thin, 0)
    else:
        fix_nib(thick, thick, 0) xyscaled(thin, terminalround)
    fi
enddef;

vardef outlinepath (expr p, thickness ) =
    pen outlinenib;  outlinenib := makepen(unitsquare scaled thickness) ;
    draw p withpen outlinenib withcolor glyphcolor;
enddef;

vardef shadowpath(expr p, d, offset) =
    save shadownpen;
    pen shadowpen ;
    shadowpen := makepen ((0,0)--(offset, 0) rotated d) ;
    fill envelope shadowpen of p withcolor black;
enddef;

primarydef pct along pat = (arctime (pct * (arclength pat)) of pat) of pat enddef ;
primarydef len on pat = (arctime len of pat) of pat enddef ;

vardef dottedpath(expr p) =
    l:=(arclength p)/100;
    % Division by 100 to avoid value of l going beyong "infinity(4095)
    for j = 0 step u/300 until l :
        fill fullcircle scaled (u/5) shifted (point j*100 on p) withcolor glyphcolor;
    endfor;
enddef;

vardef arrowpath(expr p, i) =
    pen arrowpen; arrowpen = makepen(fix_nib(u/10,u/10,0));
    % Override internal arrow head size
    ahlength := 30;
    for j=0 upto length(p):
        drawarrow rightarrow (p, point j of p, arclength subpath(j,j+1) of p*3/4)  withpen arrowpen withcolor arrowcolor;
    endfor;
    if i=0:
        fill fullcircle scaled (u/5) shifted (point 0 of p) withcolor arrowcolor;
    fi;
    if i=length(p):
        fill fullcircle scaled (u/5) shifted (point infinity of p) withcolor arrowcolor;
    fi;
enddef;

vardef pointarrow (expr pat, loc, len, off) =
    save l, r, s, t ; path l, r ; numeric s ; pair t ;
    t := if pair loc : loc else : point loc along pat fi ;
    s := len/2 - off ; if s<=0 : s := 0 elseif s>len : s := len fi ;
    r := pat cutbefore t ;
    r := (r cutafter point (arctime s of r) of r) ;
    s := len/2 + off ; if s<=0 : s := 0 elseif s>len : s := len fi ;
    l := reverse (pat cutafter t) ;
    l := (reverse (l cutafter point (arctime s of l) of l)) ;
    (l..r)
enddef ;


def centerarrow(expr p,t,l) = pointarrow(p,t,l, 0) enddef ;
def rightarrow (expr p,t,l) = pointarrow(p,t,l,-l) enddef ;
def leftarrow (expr p,t,l) = pointarrow(p,t,l,+l) enddef ;

vardef show_coordinates (expr p ) =
    % Debug points are hard to see. Change the fontsize
    defaultscale :=2;

    for i=0 upto length(p):
        pair a;a:=point i of p;
        pair b;b:=point i+1 of p;
        string pointlabel; pointlabel := decimal(i) & "(" & decimal(round(xpart(a))) & "," & decimal(round(ypart(a))) & ")";
        dotlabel.bot(pointlabel, a) withcolor debugcolor;
    endfor;

enddef;

def anchor = label enddef;

vardef boundingbox(expr p, lbearing, rbearing) =
    % In debug mode, show more vertical and horizontal regions
    if showgrids > 0:
    (-.1em, 0 - 0.1em) -- (-.1em,em+.1em) -- (xpart(urcorner p)+rbearing + .1em, em+.1em) -- (xpart(urcorner p)+rbearing + .1em,0 - .1em) -- cycle
    else:
    (0, 0) -- (0,em) -- (xpart(urcorner p)+rbearing, em) -- (xpart(urcorner p)+rbearing,0) -- cycle
    fi
enddef;

def beginglyph =
    begingroup
    % Resets
    clearxy; clearit; clearpen;
    pickup defaultpen;
    drawoptions();

    save paths, strokes;
    path paths[], strokes[];
enddef;

def endglyph =
    path softpath;
    if known drawshadow:
        for i=0 upto 10:
            if known strokes[i]:
                shadowpath(strokes[i], shadowdirection, shadowoffset);
            fi;
        endfor;
    fi;

    if known drawoutline:
        for i=0 upto 10:
            if known strokes[i]:
                outlinepath(strokes[i], outlinethickness);
            fi;
        endfor;
    fi;

    for i=0 upto 10:
        if varstroke = 1:
            if known strokes[i]:
                if (thin = 1) and (terminalround = 1):
                    pen_stroke()(paths[i])(strokes[i]);
                fi;
                if (soften > 0):
                    if known strokes[i]b:
                        softpath := soften_nodes(strokes[i], cornerradius)(
                            0,
                            length(strokes[i]l),
                            length(strokes[i]l) + length(strokes[i]e),
                            length(strokes[i]l) + length(strokes[i]r) + length(strokes[i]e)
                        );
                        fill softpath withcolor glyphcolor;
                    fi;
                else:
                    fill strokes[i] withcolor glyphcolor;
                fi;
            fi;
        fi;


        if known paths[i]:
            if known calligraphic:
                draw paths[i] withpen roundedwidenib withcolor glyphcolor;
            fi;
            if show_paths = 1:
                draw paths[i] withpen nib withcolor 0.5white;
            fi;
            if show_arrows = 1:
                arrowpath(paths[i],i);
            fi;
            if show_dots = 1:
                dottedpath(paths[i]);
            fi;
            if showcoords = 1:
                show_coordinates(paths[i]);
            fi;
        fi;
    endfor;

    currentpicture := currentpicture
        shifted (lbearing, descent);

    if slant <> 0:
        currentpicture := currentpicture
            slanted tand(slant)
            shifted(-ascent*tand(slant),0);
    fi;
    % Place the drawing at the svg canvas.
    pair ur; ur:=urcorner currentpicture;
    path bbox; bbox = boundingbox(currentpicture, lbearing, rbearing);
    setbounds currentpicture to bbox;
    currentpicture := currentpicture shifted (lbearing, 0);
    if showgrids = 1:
        % Debug points are hard to see. Change the fontsize
        defaultscale := 2;
        pair w; w:=urcorner currentpicture;
        draw (0, 0) -- (xpart w, 0) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, descent) -- (xpart w, descent) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, mheight+descent) -- (xpart w, mheight+descent) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, xheight+descent) -- (xpart w, xheight+descent) withpen pencircle scaled 0.5 withcolor gridcolor;
        draw (0, 0) -- (0, em) withpen pencircle scaled 1 withcolor gridcolor;
        draw (lbearing, 0) -- (lbearing, em) withpen pencircle scaled 1 withcolor gridcolor;
        draw ( xpart ur + lbearing+ rbearing, 0) -- (xpart ur  + lbearing + rbearing, em) withpen pencircle scaled 1 withcolor gridcolor;
        draw ( xpart ur  + lbearing , 0) -- (xpart ur  + lbearing , em) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, em) -- (xpart w, em) withpen pencircle scaled 1 withcolor gridcolor;
    fi;

    if showcoords = 1:
        % Debug points are hard to see. Change the fontsize
        defaultscale := 2;
        pair w; w:=urcorner currentpicture;
        dotlabel.urt( "(0, " & decimal(0) & ")", (0, descent))  withcolor debugcolor;
        dotlabel.urt( "(0, " & decimal(mheight) & ")", (0, mheight+descent))  withcolor debugcolor;
        dotlabel.lrt( "(" & decimal(lbearing) & ",0  )", (lbearing,  descent))  withcolor debugcolor;
        dotlabel.lft( "(" & decimal(round(xpart ur) - rbearing) & ",0  )", (xpart ur +  lbearing + rbearing,  descent))  withcolor debugcolor;
    fi;
    shipit;
    endgroup
enddef;

input malayalam;
input latin;