input plain_ex;
input config;

maybeinput font.mp; % Customization for a font variant. If file does not exist, skips.

% Pens
input ./pens

pen nib; nib := finenib; % roundedwidenib

vardef outlinepath (expr p, thickness ) =
    numeric L;
    path penpath;
    L:=32;
    penpath:=( (thickness*cosd(0),thickness*sind(0)) for i=1 upto L-1: -- (thickness*cosd(i/L*360), thickness*sind(i/L*360)) endfor -- cycle ) rotated rotation;
    pen outlinenib ; outlinenib := makepen(penpath) ;
    fill envelope outlinenib of p withcolor black;;
enddef;

vardef shadowpath(expr p, d, offset) =
    save shadownpen;
    pen shadowpen ;
    shadowpen := makepen ((0,0)--(offset, 0) rotated d) ;
    fill envelope shadowpen of p withcolor black;
enddef;

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
    (0, 0) -- (0,em) -- (xpart(urcorner p)+lbearing+rbearing, em) -- (xpart(urcorner p)+lbearing+rbearing,0) -- cycle
enddef;

def beginglyph=
    beginfig(1);
    save m,s,X;
    path paths[], strokes[];

    % Aliases
    m   := mheight;
    s   := xheight;      % x is a special symbol. So let us use s
    X   := Xheight;

    sw  := s * condense; % Width of Latin small letters
    mw  := m * condense; % Width of Malayalm letters
    Xw  := X * condense; % Width of Latin capital letters
    lbearing := lbearing * condense;
    rbearing := rbearing * condense;

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
                for j=0 upto length(paths[i]):
                    drawarrow subpath(j, 0.9(j+1)) of paths[i] withpen pencircle scaled 4 withcolor arrowcolor;
                endfor;
            fi;
            if showcoords = 1:
                show_coordinates(paths[i]);
            fi;
        fi;
    endfor;

    currentpicture := currentpicture
        shifted (0, descent)
        slanted slant;

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
        draw (lbearing, 0) -- (lbearing, em) withpen pencircle scaled 1 withcolor gridcolor;
        draw ( xpart ur, 0) -- (xpart ur, em) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, em) -- (xpart w, em) withpen pencircle scaled 1 withcolor gridcolor;
    fi;

    if showcoords = 1:
        % Debug points are hard to see. Change the fontsize
        defaultscale := 2;
        pair w; w:=urcorner currentpicture;
        dotlabel.urt( "(0, " & decimal(0) & ")", (0, descent))  withcolor debugcolor;
        dotlabel.urt( "(0, " & decimal(mheight) & ")", (0, mheight+descent))  withcolor debugcolor;
        dotlabel.lrt( "(" & decimal(lbearing) & ",0  )", (lbearing,  descent))  withcolor debugcolor;
        dotlabel.lft( "(" & decimal(round(xpart ur) - rbearing) & ",0  )", (xpart ur + rbearing,  descent))  withcolor debugcolor;
    fi;
    endfig;
enddef;