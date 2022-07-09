input plain_ex;
input config;

maybeinput font.mp; % Customization for a font variant. If file does not exist, skips.

vardef outline (expr p ) =
    draw envelope nib of p
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

vardef shadowpath(expr p, d, offset) =
    save q; path s, q, r;
    find_outlines(p)(s);
    q:= s1;
    if not cycle q:
        errmessage "Path is not cyclic";
    fi;
    for i=1 upto offset-1:
        find_outlines(q, s1 shifted (i*cosd(d), i*sind(d)) ) (r);
        if known r1:
            q:=r1;
        fi;
    endfor;
    q
enddef;

def beginglyph=
    beginfig(1);
    lbearing:= 0.5u;
    rbearing:= 0.5u;
enddef;

def endglyph =
    path softpath;
    for i=0 upto 10:
        if varstroke = 1:
            if known strokes[i]:
                softpath := soften_path(strokes[i], 10);
                if known donotsoften:
                    fill strokes[i] withcolor glyphcolor;
                else:
                    fill softpath withcolor glyphcolor;
                fi;
            fi;
        fi;

        if known paths[i]:
            if show_paths = 1:
                draw paths[i] withpen nib withcolor 0.5white;
            fi;
            if show_arrows = 1:
                for j=0 upto length(paths[i]):
                    drawarrow subpath(j, 0.9(j+1)) of paths[i] withpen pencircle scaled thick withcolor arrowcolor;
                endfor;
            fi;
            if debug = 1:
                show_coordinates(paths[i]);
            fi;
        fi;
    endfor;

    currentpicture := currentpicture
        shifted (lbearing, descent)
        xscaled condense
        slanted slant;

    % Place the drawing at the svg canvas.
    pair ur; ur:=urcorner currentpicture;
    path bbox; bbox = llcorner currentpicture -- lrcorner currentpicture -- urcorner currentpicture -- (xpart ur+rbearing,em) -- cycle;
    setbounds currentpicture to bbox;

    if debug = 1:
        % Debug points are hard to see. Change the fontsize
        defaultscale := 2;
        pair w; w:=urcorner currentpicture;
        draw (0, 0) -- (xpart w, 0) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, descent) -- (xpart w, descent) withpen pencircle scaled 1 withcolor debugcolor;
        dotlabel.urt( "(0, " & decimal(0) & ")", (0, descent))  withcolor debugcolor;
        draw (0, mheight+descent) -- (xpart w, mheight+descent) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, xheight+descent) -- (xpart w, xheight+descent) withpen pencircle scaled 0.5 withcolor gridcolor;
        draw (0, Xheight+descent) -- (xpart w, Xheight+descent) withpen pencircle scaled 0.5 withcolor gridcolor;
        dotlabel.urt( "(0, " & decimal(mheight) & ")", (0, mheight+descent))  withcolor debugcolor;
        draw (lbearing, 0) -- (lbearing, em) withpen pencircle scaled 1 withcolor gridcolor;
        draw ( xpart ur, 0) -- (xpart ur, em) withpen pencircle scaled 1 withcolor gridcolor;
        draw (0, em) -- (xpart w, em) withpen pencircle scaled 1 withcolor gridcolor;
    fi;
    endfig;
enddef;