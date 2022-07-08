%%%% THIS FILE IS DISTRIBUTED WITH THE METATYPE1 PACKAGE
%%%%
%%%% It is an extension of plain.mp
%% \raggedbottom
%% \edef\illusname{plain\string_e\string_}
%% \--------------------------------------------------------------------
%% \centering \BF EXTENSION OF \MP{} plain FORMAT (ver. 0.47)
%% \-
%% \centering \BF ROZSZERZENIE \MP{}-owego FORMATU plain (wer. 0.47)
%% \--------------------------------------------------------------------
if known plain_ex_ver: expandafter endinput else: plain_ex_ver:=.47; fi
def killtext text t = enddef; % absent from older versions of plain.mf
%% \--------------------------------------------------------------------
%% Knuthian tradition:
%% \-
%% Knuthowa tradycja:
%% \--------------------------------------------------------------------
mm#=2.84528; pt#=1; dd#=1.07001; bp#=1.00375; cm#=28.45276; pc#=12;
cc#=12.84010; in#=72.27;
%% \--------------------------------------------------------------------
%% A patch for bugs in \MP{} |turningnumber| functionality
%% \-
%% Makra /lataj/ace wadliwe funkcjonowanie operacji |turningnumber|
%% \--------------------------------------------------------------------
let original_turningnumber = turningnumber;
vardef straighten_path(expr r) =
 for k=0 upto length r - 1: point k of r -- endfor
if cycle r: cycle else: point infinity of r fi enddef;
vardef emergency_turningnumber primary r =
 original_turningnumber(straighten_path(r))
enddef;
def use_emergency_turningnumber =
 def turningnumber = emergency_turningnumber enddef;
enddef;
def use_original_turningnumber =
 def turningnumber = original_turningnumber enddef;
enddef;
%% \--------------------------------------------------------------------
%% Loading a file optionally
%% \-
%% Opcjonalne czytanie pliku
%% \--------------------------------------------------------------------
boolean maybeinput_ok; string maybedir;
vardef maybename(text name) =
 if known maybedir: maybedir & fi if string name: name else: str name fi
enddef;
def maybeinput text name =
 if (readfrom maybename(name))=EOF:
  message "PX: file " & maybename(name) & " cannot be read";
  maybeinput_ok:=false;
 else:
  closefrom maybename(name); scantokens ("input " & maybename(name));
  maybeinput_ok:=true;
 fi
enddef;
%% \--------------------------------------------------------------------
%%   A few colours more:
%% \-
%%   Par/e dodatkowych kolor/ow:
%% \--------------------------------------------------------------------
color cyan, magenta, yellow; cyan=(0,1,1); magenta=(1,0,1); yellow=(1,1,0);
%% \--------------------------------------------------------------------
%% A few functions more:
%% \-
%% Par/e dodatkowych funkcji:
%% \--------------------------------------------------------------------
vardef gen_whatever(text type) = save ?; type ?; ? enddef; % 1-argument func.
vardef whatever_pair = gen_whatever(pair) enddef; % 0-argument function
vardef tand primary a = sind(a)/cosd(a) enddef;
vardef cotd primary a = cosd(a)/sind(a) enddef;
vardef signum primary x = if x>0: 1 elseif x<0: -1 else: 0 fi enddef;
primarydef w dotnorm z =
 begingroup
  save w_, z_, lw_, lz_; pair w_, z_;
  lw_=abs(w); w_:=w if lw_>0: /lw_ fi;
  lz_=abs(z); z_:=z if lz_>0: /lz_ fi;
  (xpart w_ * xpart z_ + ypart w_ * ypart z_)
 endgroup
enddef;
%
let ori_decimal=decimal;
def decimal primary n =
 (
  if path n:
   for i_=0 upto length(n)-1: if i_>0: & " " & fi
    decimal(point i_ of n) & " " & decimal(postcontrol i_ of n)  & " " &
     decimal(precontrol i_+1 of n)  & " " & decimal(point i_+1 of n)
   endfor
  elseif color n: ori_decimal(redpart(n)) & " " &
   ori_decimal(greenpart(n)) & " " & ori_decimal(bluepart(n))
  elseif pair n: ori_decimal(xpart(n)) & " " & ori_decimal(ypart(n))
  else: ori_decimal(n) fi
 )
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The definition of |postdir| and |predir| given below is
% based on the following observation, being the consequence
% of the de~l'H\^ospital's rule: consider a~B\'ezier segment
% |a .. controls b and c .. d|; normally, the vector $\vec{ab}$
% determines the ``post'' direction at node~$a$; if $b$
% coincides with $a$, then the vector $\vec{ac}$ determines
% the direction; if also $c$ coincides coincides with~$a$,
% then the last resort is the vector $\vec{ad}$; if even $d$
% coincides with~$a$, the B\'ezier segment is degenerated,
% and can be removed (a~similar argumentation can be provided
% for the ``pre'' direction at node~$d$).
%% \-
%% \descriptioncomments
% Definicje makr |postdir| i~|predir| wykorzystuj/a nast/epuj/ac/a
% obserwacj/e, b/ed/ac/a prost/a konsekwencj/a regu/ly de~l'H\^ospitala:
% rozwa/zmy segment |a .. controls b and c .. d|; w~normalnej sytuacji
% kierunek ,,post'' w~punkcie~$a$ jest okre/slony przez
% wektor $\vec{ab}$; je/zeli punkty $a$ i~$b$ si/e pokrywaj/a,
% kierunek ,,post'' w~punkcie~$a$ jest okre/slony przez
% wektor $\vec{ac}$; je/zeli tak/ze punkty $a$ i~$c$ si/e pokrywaj/a,
% ostatni/a szans/a na wyznaczenie kierunku ,,post'' w~punkcie~$a$
% jest wektor $\vec{ad}$; je/zeli wszystkie punkty $a$, $b$, $c$, i~$d$
% si/e pokrywaj/a, to oznacza, /ze segment jest zdegenerowany i~mo/ze
% by/c w zasadzie usuni/ety (analogiczn/a argumentacj/e mo/zna przedstawi/c
% dla kierunku ,,pre'' w punkcie~$d$).
%% \--------------------------------------------------------------------
% Previous, insufficiently robust definitions:
% |vardef predir expr t of p = (point t of p)-(precontrol t of p) enddef;|
% |vardef postdir expr t of p = (postcontrol t of p)-(point t of p) enddef;|
% |vardef udir expr t of p = unitvector(direction t of p) enddef;|
% New, more general definitions:
vardef gendir expr t of p =
 predir t of p + postdir t of p % |direction|-compatible definition
enddef;
vardef predir expr t of p =
 save a_,b_,c_,d_,s_,t_; pair a_,b_,c_,d_; path s_; t_:=t;
 if not cycle p: if t<0: t_:=0; elseif t>length(p): t_:=length(p); fi fi
  s_=subpath (ceiling t_-1,t_) of p;
  a_=point 0 of s_;
  b_=postcontrol 0 of s_; % |b_<>postcontrol t-1 of p| for |t=0|
  c_=precontrol 1 of s_;
  d_=point 1 of s_;
  if d_<>c_:     d_-c_
  elseif d_<>b_: d_-b_
  elseif d_<>a_: d_-a_
  else:       (0,0)
 fi
enddef;
vardef postdir expr t of p =
 save a_,b_,c_,d_,s_,t_; pair a_,b_,c_,d_; path s_; t_:=t;
 if not cycle p: if t<0: t_:=0; elseif t>length(p): t_:=length(p); fi fi
  s_=subpath (t_,floor t_+1) of p;
  a_=point 0 of s_;
  b_=postcontrol 0 of s_;
  c_=precontrol 1 of s_; % |c_<>precontrol t+1 of p| for |t=length p|
  d_=point 1 of s_;
  if a_<>b_:     b_-a_
  elseif a_<>c_: c_-a_
  elseif a_<>d_: d_-a_
  else:       (0,0)
 fi
enddef;
%% \--------------------------------------------------------------------
% Definitions related to ``pre-'' and ``post-'':
%% \-
% Definicje jako/s zwi/azane z~,,pre-'' i~,,post-'':
%% \--------------------------------------------------------------------
vardef udir expr t of p = unitvector(gendir t of p) enddef;
vardef upredir expr t of p = unitvector(predir t of p) enddef;
vardef upostdir expr t of p = unitvector(postdir t of p) enddef;
vardef pos_subpath expr z of p =
 if not cycle p: subpath z of p else:
  if xpart(z)<=ypart(z): subpath z of p
  else: subpath (xpart(z),ypart(z)+length(p)) of p fi
 fi
enddef;
%
vardef posttension expr t of p = % ``The \MF{}book'', ex. 14.15
 save q_; path q_;
 q_=point t of p {direction t of p} .. {direction t+1 of p} point t+1 of p;
 length(postcontrol 0 of q_ - point 0 of q_)/
 length(postcontrol t of p - point t of p)% doesn't work for ``straight lines''
enddef;
vardef pretension expr t of p = % ditto
 save q_; path q_;
 q_=point t-1 of p {direction t-1 of p} .. {direction t of p} point t of p;
 length(precontrol 1 of q_ - point 1 of q_)/
 length(precontrol t of p - point t of p)% doesn't work for ``straight lines''
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The two macros below, |path_eq| and |inside| macros, might have been
% primitives. The macro |path_eq| is obvious; |a inside b| returns true
% if the bounding box of |a| is inside the bounding box of |b|, which
% may be misleading; think, for example of:
% |fullcircle inside unitsquare shifted (-1/2,-1/2) scaled .9 rotated 45|.
% For most curves occuring in fonts, however, one can safely infere
% that if |a inside b| holds, then |a| is inside |b|.
%% \-
%% \descriptioncomments
% Poni/zsze dwa makra mog/lyby by/c w~zasadzie instrukcjami podstawowymi.
% Makro |path_eq| jest oczywiste. Wynikiem operacji |a inside b| jest
% ,,true'' je/zeli prostok/at ograniczaj/acy |a| le/zy wewn/atrz prostok/ata
% ograniczaj/acego |b|, co mo/ze dawa/c wynik myl/acy, np.~w~wypadku
% |fullcircle inside unitsquare shifted (-1/2,-1/2) scaled. 9 rotated 45|.
% Jednak/ze w~wi/ekszo/sci sytuacji wyst/epuj/acych fontach
% mo/zna /smia/lo zak/lada/c, /ze z~|a inside b| wynika, i/z |a| le/zy
% wewn/atrz~|b|.
%% \--------------------------------------------------------------------
vardef path_eq(expr a,b)=
 save i_,l_,r_; boolean r_;
 r_:=(length(a)=length(b)) and (cycle a= cycle b);
 if r_:
  i_:=0; l_:=length(a) if cycle a: -1 fi;
  forever:
   r_:=(point i_ of a = point i_ of b); exitif not r_;
   r_:=(precontrol i_ of a = precontrol i_ of b); exitif not r_;
   r_:=(postcontrol i_ of a = postcontrol i_ of b); exitif not r_;
   exitif incr i_>l_;
 endfor fi
 r_
enddef;
%
tertiarydef a inside b =
 if path a: % |and path b|
  (xpart llcorner b < xpart llcorner a) and
  (xpart urcorner b > xpart urcorner a) and
  (ypart llcorner b < ypart llcorner a) and
  (ypart urcorner b > ypart urcorner a)
 else: % |numeric a and pair b|
  (a>=xpart b) and (a<=ypart b)
 fi
enddef;
%% \--------------------------------------------------------------------
%  Two convenient macros more:
%% \-
%  Jeszcze dwa wygodne makra:
%% \--------------------------------------------------------------------
vardef x_time expr x of p = % obsolete
 xpart(p intersectiontimes ((x,-infinity)--(x,infinity)))
enddef;
vardef y_time expr y of p = % obsolete
 xpart(p intersectiontimes ((-infinity,y)--(infinity,y)))
enddef;
vardef xtime expr x of p = % preferable alias
 xpart(p intersectiontimes ((x,-infinity)--(x,infinity)))
enddef;
vardef ytime expr y of p = % preferable alias
 xpart(p intersectiontimes ((-infinity,y)--(infinity,y)))
enddef;
%% \--------------------------------------------------------------------
%%   A few figures more:
%% \-
%%   Par/e dodatkowych figur:
%% \--------------------------------------------------------------------
vardef triangle =
 (0,-1/2)--(0.866,0)--(0,1/2)--cycle % |1/2sqrt(3)| $\approx$ |0.866025...|
enddef;
vardef vpolygon(expr n) =
 for i:=0 upto n-1: (1/2right rotated ((360/n)*(i+1/2))) -- endfor cycle
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% A method, entangled a bit and not particularly robust, of testing whether
% a parameter is a {\it string\/} expression or a {\it suffix}.
% (Remark: |is_suffix((a))| or |is_suffix(a+b)| returns |true|;
% |is_suffix(((a)))| causes \MP{} to report an error).
%% \-
%% \descriptioncomments
% Nieco pokr/etna i niezbyt og/olna metoda sprawdzania, czy parametr
% jest wyra/zeniem typu {\it string\/} czy {\it sufiksem}.
% (Uwaga: |is_suffix((a))| b/ad/x |is_suffix(a+b)| zwraca |true|,
% za/s |is_suffix(((a)))| powoduje, /ze \MP{} zg/lasza b/l/ad).
%% \--------------------------------------------------------------------
vardef is_suffix(text suffix_or_not_suffix) =
 save the_suffix_; string the_suffix_; is_suffix_ suffix_or_not_suffix;
 the_suffix_<>""
enddef;
def is_suffix_ suffix $ = the_suffix_:= str $; killtext enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The macro |&&| is to be used instead of the |&| operator if the respective
% ends of paths coincide only approximately; using |..| instead would add
% unwanted tiny B\'ezier segments. The macro is somewhat ``left-handed,''
% i.e., it does not consider the expression that follow the macro, therefore,
% it can be used before the `|cycle|' command; if the argument |p| of the
% macro |amp_amp_| is a |pair|, it is just ignored which may be
% considered hardly intuitive.
%% \-
%% \descriptioncomments
% Makra |&&| nale/zy u/zywa/c zamiast operatora |&| je/sli ko/nce /scie/zek
% nie pokrywaj/a si/e idealnie; u/zycie operatora |..| zamiast |&|
% spowodowa/loby dodanie do /scie/zki zb/ednych (ma/lych) segment/ow
% B\'eziera. Makro to jest nieco ,,lewor/eczne'', tzn.~nie analizuje
% wyra/zenia, kt/ore si/e po nim pojawi, dzi/eki czemu mo/ze by/c u/zyte
% przed operatorem ,|cycle|'; argument |p| makra |amp_amp_| b/ed/acy
% punktem (|pair|) jest pomijany, co mo/zna uzna/c za zachowanie ma/lo
% intuicyjne.
%% \--------------------------------------------------------------------
def && = amp_amp_ whatever enddef;
tertiarydef p amp_amp_ q =
 if not pair p:
  (subpath(0,length(p)-1) of p) .. controls (postcontrol length(p)-1 of p)
   and (precontrol length(p) of p) ..
 fi
enddef;
%% \--------------------------------------------------------------------
%% A few postfix and infix path operators:
%% \-
%% Par/e postfiksowych i~infiksowych operator/ow /scie/zkowych:
%% \--------------------------------------------------------------------
primarydef a mirr b = a reflectedabout(origin,b) enddef;
%
def store_prec_obj = store_prec_obj_ whatever enddef;
primarydef a store_prec_obj_ b = hide(def prec_obj = a enddef) enddef;
%
primarydef a sub b =
 if path a: (pos_subpath b of a) elseif string a: (substring b of a) fi
enddef;
%
def node = store_prec_obj node_ enddef;
vardef node_@# primary a =
 if str @#="x": xpart(point a of prec_obj)
 elseif str @#="y": ypart(point a of prec_obj)
 elseif str @#="": point a of prec_obj
 else:
  errhelp "The operator `node' works only with `x', `y' or an empty suffixes.";
  errmessage "PX: improper usage of `node'";
 fi
enddef;
%
def first suffix $ =
 if str $="at": % moves the first point of a path to a specified location
  store_prec_obj prec_obj shifted -(point 0 of prec_obj) shifted
 else: node$(0) fi
enddef;
def last suffix $ =
 if str $="at": % moves the last point of a path to a specified location
  store_prec_obj prec_obj shifted
   -(point if cycle prec_obj: 0 else: infinity fi of prec_obj) shifted
 else: node$(if cycle prec_obj: 0 else: infinity fi) fi
enddef;
%
% node-governed flipping:
def nflipped = nflipped_ whatever enddef;
primarydef a nflipped_ b =
 if cycle a: a
 else: reverse(a reflectedabout (point 0 of a, point infinity of a))
 fi
enddef;
%
def xflipped = xflipped_ whatever enddef;
primarydef a xflipped_ b =
 reverse(a reflectedabout
   (1/2[llcorner a, lrcorner a], 1/2[ulcorner a, urcorner a]))
enddef;
%
def yflipped = yflipped_ whatever enddef;
primarydef a yflipped_ b =
 reverse(a reflectedabout
   (1/2[llcorner a, ulcorner a], 1/2[lrcorner a, urcorner a]))
enddef;
%
% node-governed rotating (infix operator):
primarydef a nrotated b =
 if cycle a: a
 else: a rotatedaround(1/2[point 0 of a,point infinity of a], b)
 fi
enddef;
%
% center-governed rotating (infix operator):
primarydef a crotated b =
 a rotatedaround(1/2[llcorner a, urcorner a], b)
enddef;
%% \--------------------------------------------------------------------
%% Neat macros excerpted from John D. Hobby's boxes.mp macro package:
%% \-
%% Zgrabne makra zaczerpni/ete z zestawu makr boxes.mp Johna D. Hobby'ego:
%% \--------------------------------------------------------------------
% Find the length of the prefix of string |s| for which |cond| is true for
% each character |c| of the prefix
vardef generisize_prefix(expr s)(text cond) =
 save i_, c_; string c_;
 i_ = 0;
 forever:
  c_ := substring (i_,i_+1) of s;
  exitunless cond; exitif incr i_=length s;
 endfor
 i_
enddef;
%
% Take a string returned by the |str| operator and return the same string
% with explicit numeric subscripts replaced by generic subscript symbols []:
vardef generisize(expr s) =
 save res_, s_, l_; string res_, s_;
 res_=""; % result so far
 s_ =s; % left to process
 forever: exitif s_="";
  l_:=generisize_prefix(s_, (c_<>"[") and ((c_<"0") or (c_>"9")));
  res_:=res_ & substring (0,l_) of s_;
  s_:=substring (l_,infinity) of s_;
  if s_<>"":
   res_ := res_ & "[]";
   l_ :=if s_>="[": 1+generisize_prefix(s_, c_<>"]")
    else: generisize_prefix(s_, (c_=".") or ("0"<=c_) and (c_<="9")) fi;
   s_:=substring(l_,infinity) of s_;
  fi
 endfor
 res_
enddef;
%%\vfill\eject
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The macro |extrapolate| computes a ``superpath'' (as opposed to
% ``subpath'') for a single B\'ezier segment in such a way
% that the following identity holds
% (for 0${}\le{}$|t1|${}\le{}$|t2|${}\le{}$1):
%% \-
%% \descriptioncomments
% Makro |extrapolate| wyznacza ,,nad/scie/zk/e'' (w~odr/o/znieniu od
% ,,pod/scie/zki'') dla pojedynczego /luku B\'eziera w~taki spos/ob,
% /ze poni/zsza r/owno/s/c jest spe/lniona (dla
% 0${}\xle{}$|t1|${}\xle{}$|t2|${}\xle{}$1):
%% %
%% \LINE{%
%% \descriptioncomments
%   |subpath (t1,t2) of (extrapolate (t1,t2) of b) = b|
%% \unskip}
%% %
%% \descriptioncomments
% Below, there are the results of the command |extrapolate (.3,.7) of p|
% for three similarly defined paths. The black line denotes the source
% path, the gray one---its~extrapolation.
%% \-
%% \descriptioncomments
% Poni/zsza ilustracja przedstawia wynik polecenia |extrapolate (.3,.7) of p|
% dla trzech podobnie zdefiniowanych /scie/zek. Czarn/a lini/a zaznaczona
% zosta/la /scie/zka oryginalna, szar/a~--~ekstrapolowana.
%% %
%% \LINE{\valign{#\vss\cr
%%   \hbox{\epsfbox{\illusname.100}}\cr\noalign{\hfil}
%%   \hbox{\epsfbox{\illusname.101}}\cr\noalign{\hfil}
%%   \hbox{\epsfbox{\illusname.102}}\cr
%% }}
%% %
%% \descriptioncomments
% Exercise 1. What happens if the relation
% 0${}\le{}$|t1|${}\le{}$|t2|${}\le{}$1
% is not fulfilled? (Hint: there are~a~few
% possible cases.)\vadjust{\smallskip}\break
% Exercise 2. True or false:
%% \-
%% \descriptioncomments
% Zadanie 1. Co by si/e sta/lo, gdyby warunek
% 0${}\xle{}$|t1|${}\xle{}$|t2|${}\xle{}$1 nie by/l spe/lniony?
% (Wskaz/owka: mo/zliwych jest kilka r/o/znych
% przypadk/ow.)\vadjust{\smallskip}\break
% Zadanie 2. Prawda czy fa/lsz:
%% %
%% \LINE{%
%% \descriptioncomments
%  |point 1 of (extrapolate (t.a,t) of b) = point 1 of (extrapolate (t.b,t) of b)|
% \quad for\quad |t.a<>t.b|
%% \unskip}
%% %
%% \descriptioncomments
% Exercise 3. Try to imagine the result of the extrapolation for
% such weird (yet trivial) paths~as:%
%% \-
%% \descriptioncomments
% Zadanie 3. Spr/obuj przewidzie/c wynik ekstrapolacji dla tak dziwnych
% (chocia/z trywialnych) /scie/zek~jak:%
%% \LINE{%
%% \descriptioncomments
%  |(0,0) .. controls (0,0) and (100,0) .. (100,0)| \quad or\quad
%  |(0,0) .. controls (100,0) and (0,0) .. (100,0)|
%% \unskip}
%% \--------------------------------------------------------------------
vardef extrapolate expr t of b = % |t| pair, |b| B\'ezier segment
 clearxy;
 Casteljau(xpart(t)) = point 0 of b;
 Casteljau(1/3[xpart(t),ypart(t)]) = point 1/3 of b;
 Casteljau(2/3[xpart(t),ypart(t)]) = point 2/3 of b;
 Casteljau(ypart(t)) = point 1 of b;
 z0 .. controls z1 and z2 .. z3
enddef;
%
def Casteljau(expr t) =
 t[t[t[z0,z1], t[z1,z2] ], t[t[z1,z2], t[z2,z3] ] ]
enddef;
%
vardef elongation_to_times(expr ea,eb) =
 % negative parameter values are admissible; they are meant for |pen_stroke|
 (if ea<0: - fi 1/(abs(ea)+1), eb/(abs(eb)+1))
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% A~numerical function `|point_line_dist|' takes as a~parameter
% three |pair| expressions and returns a~(signed) value of the distance
% of the first parameter from the line defined by the other two.
% It is referred to in the `|is_line|' function.
%% \-
%% \descriptioncomments
% Funkcja ,|point_line_dist|', zale/zna od trzech wyra/ze/n typu |pair|,
% oblicza odleg/l/o/s/c (dodatni/a lub ujemn/a) pierwszego z~parametr/ow
% od linii okre/slonej przez dwa pozosta/le parametry. Do funkcji
% ,|point_line_dist|' odwo/luje si/e funkcja ,|is_line|'.
%% \--------------------------------------------------------------------
vardef point_line_dist(expr a,b,c) =
 clearxy; save d_; d_=sqrt(length(b-c));
 z0=a/d_; z1=b/d_; z2=c/d_;
 (x2-x1)*(y1-y0)-(x1-x0)*(y2-y1)
enddef;
%% \--------------------------------------------------------------------
%% The following code (its idea is due to Dan Luecking and Larry Siebenmann)
%% computes the area surrounded by a cyclic path.
%% \-
%% Poni/zszy kod (pomys/l podsun/eli Dan Luecking i~Larry Siebenmann)
%% oblicza pole obszaru ograniczonego zamkni/et/a krzyw/a B\'eziera.
%% \--------------------------------------------------------------------
newinternal area_scale;
area_scale:=1; % decrease if the result is going to be too large
vardef area(expr p) = % |p| is a B\'ezier segment; result = $\int y\, dx$
 save xa, xb, xc, xd, ya, yb, yc, yd;
 (xa,20ya)=point 0 of p;
 (xb,20yb)=postcontrol 0 of p;
 (xc,20yc)=precontrol 1 of p;
 (xd,20yd)=point 1 of p;
   area_scale*(xb-xa)*(10ya + 6yb + 3yc +   yd)
  +area_scale*(xc-xb)*( 4ya + 6yb + 6yc +  4yd)
  +area_scale*(xd-xc)*(  ya + 3yb + 6yc + 10yd)
enddef;
vardef Area(expr P) = % |P| is a cyclic path
 area(subpath (0,1) of P)
  for t=1 upto length(P)-1: + area(subpath (t,t+1) of P) endfor
enddef;
%% \--------------------------------------------------------------------
%% The idea of calculation of a turning angle
%% between two vectors, employed in the definition of the function
%% `turn_ang,' is based on the following observation:
%% \-
%% Idea obliczania k/ata (skierowanego) mi/edzy dwoma wektorami,
%% wykorzystana w~funkcji ,turn_ang', zasadza si/e na nast/epuj/acej
%% obserwacji:
%% %
%% \LINE{%
%% \descriptioncomments
%   |z reflectedabout(origin,right)=1/z|
%% \unskip}
%% %
%% for a complex number $z$ such that $\vbar z\vbar=1$;
%% recall also that multiplication of complex numbers
%% (`zscaled' operation) implies addition of their angle arguments.
%% \-
%% dla liczby zespolonej $z$ takiej, /ze $\vbar z\vbar=1$; przypomnijmy
%% tak/ze, /ze mno/zeniu liczb zespolonych (operacja ,zscaled')
%% odpowiada dodawanie argument/ow k/atowych.
%% \--------------------------------------------------------------------
vardef turn_ang(expr za,zb) =
 if (abs(za)>=1/1000) and (abs(zb)>=1/1000): % |eps| may be not enough
  angle(unitvector(za) zscaled (unitvector(zb) reflectedabout (origin,right)))
 else: whatever fi
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% A~Boolean function `|is_line|' checks whether a~given B\'ezier segment
% is a~straight line. For large segments (fonts) it makes sense to specify
% a~numerical parameter |is_line_off>=0|; it defines a~maximal acceptable
% distance of the control points of a~B\'ezier arc from its secant
% (which corresponds to the distance between the arc and the secant
% circa |3/4is_line_off| for a symmetric, inflexionless arcs).
%% \-
%% \descriptioncomments
% Boole'owska funkcja, ,|is_line|' sprawdza, czy dany segment B\'eziera
% jest lini/a prost/a. Dla du/zych segment/ow (fonty) mo/ze mie/c sens zadanie
% parametru numerycznego |is_line_off>=0|; okre/sla on maksymalne dopuszczalne
% odchylenie naci/ag/ow krzywej B\'eziera od siecznej (co odpowiada
% odleg/lo/sci krzywej od siecznej wynosz/acej ok.~|3/4is_line_off|
% dla symetrycznych /luk/ow bez punkt/ow przegi/ecia).
%% \--------------------------------------------------------------------
vardef is_line(expr B) =
 save r_; boolean r_;
 if known is_line_off:
  save a_;
  a_=length((point 1 of B)-(point 0 of B));
  r_=(-a_+arclength(B))<=(a_/infinity);
  if r_:
   r_:=(is_line_off>=abs(point_line_dist(
         postcontrol 0 of B, point 0 of B, point 1 of B))) and
       (is_line_off>=abs(point_line_dist(
         precontrol 1 of B, point 0 of B, point 1 of B)));
  fi
 else: % backward compatibility
  save a_,b_,c_,d_;
  a_=length((point 1 of B)-(point 0 of B));
  b_=length((postcontrol 0 of B)-(point 0 of B));
  c_=length((precontrol 1 of B)-(postcontrol 0 of B));
  d_=length((point 1 of B)-(precontrol 1 of B));
  r_=(-a_+b_+c_+d_ <= a_/infinity);
 fi
 r_
enddef;
%% \--------------------------------------------------------------------
%% Abbreviations for a few simple yet useful phrases:
%% \-
%% Skr/oty dla kilku prostych acz przydatnych fraz:
%% \--------------------------------------------------------------------
def xyscaled primary p = xscaled xpart(p) yscaled ypart(p) enddef;
def yxscaled primary p = yscaled xpart(p) xscaled ypart(p) enddef;
primarydef a xscaledto b =
 hide(lastscale:=b/(xpart(urcorner(a))-xpart(llcorner(a))))
 a xscaled lastscale
enddef;
primarydef a xyscaledto b =
 hide(lastscale:=b/(xpart(urcorner(a))-xpart(llcorner(a))))
 a scaled lastscale
enddef;
primarydef a yscaledto b =
 hide(lastscale:=b/(ypart(urcorner(a))-ypart(llcorner(a))))
 a yscaled lastscale
enddef;
primarydef a yxscaledto b =
 hide(lastscale:=b/(ypart(urcorner(a))-ypart(llcorner(a))))
 a scaled lastscale
enddef;
%
pair lastshift;
primarydef a llshiftedto b =
 hide(lastshift:=-llcorner(a)+b) a shifted lastshift
enddef;
primarydef a lrshiftedto b =
 hide(lastshift:=-lrcorner(a)+b) a shifted lastshift
enddef;
primarydef a urshiftedto b =
 hide(lastshift:=-urcorner(a)+b) a shifted lastshift
enddef;
primarydef a ulshiftedto b =
 hide(lastshift:=-ulcorner(a)+b) a shifted lastshift
enddef;
primarydef a ccshiftedto b =
 hide(lastshift:=-center(a)+b) a shifted lastshift
enddef;
%% \--------------------------------------------------------------------
%% Joining two paths at their intersection point:
%% \-
%% /L/aczenie dw/och scie/zek w punkcie ich przeci/ecia:
%% \--------------------------------------------------------------------
tertiarydef a intersection_join b = % like |softjoin|
 begingroup save t_;
  (t_1,t_2)=a intersectiontimes b; a.sub(0,t_1)&&b.sub(t_2,infinity)
 endgroup
enddef;
%% \--------------------------------------------------------------------
%% Changing locally non-internal variables (sometimes we want to set locally
%% not only numeric variables):
%% \-
%% Lokalna zmiana warto/sci zwyk/lych zmiennych (czasami zachodzi potrzeba
%% lokalnej zmiany nie tylko zmiennych numerycznych):
%% \--------------------------------------------------------------------
def local suffix s =
 begingroup
  save local_stack_value_, local_stack_name_;
  if pair s: pair local_stack_value_; fi
  if path s: path local_stack_value_; fi
  if picture s: picture local_stack_value_; fi
  if string s: string local_stack_value_; fi
  if color s: color local_stack_value_; fi
  local_stack_value_ = s; def local_stack_name_ = s enddef;
  local_
enddef;
def local_ expr x = local_stack_name_:=x enddef;
def endlocal = local_stack_name_:=local_stack_value_; endgroup; enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The following abbreviation is roughly equivalent to the Knuthian
% {\it of-the-way function}, namely, to the |whatever[z1,z2]|
% operator; observe, however, that this construction requires that
% both |z1| and |z2| should be known, while |z1| the in
% the construction |z1^z2| can be unknown.
%% \-
%% \descriptioncomments
% Poni/zszy skr/ot jest z grubsza r/ownowa/zny Knuthowej funkcji
% {\it w-p/o/l-drogi}, tzn. operatorowi |whatever[z1,z2]|;
% odnotujmy wszak/ze, /ze konstrukcja ta wymaga, by zar/owno
% |z1| jak i~|z2| by/ly znane, natomiast konstrukcja |z1^z2|
% pozwala, by |z1| by/lo nieznane.
%% \--------------------------------------------------------------------
primarydef a ^ b = a + whatever * b enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The macro `leg' computes the leg of a right-angled triangle,
% given a hypotenuse (vector, parameter~|c|) and a length
% of one leg (parameter~|b|).
%% \-
%% \descriptioncomments
% Makro ,leg' oblicza przyprostok/atn/a tr/ojk/ata prostok/atnego
% przy za/lo/zeniu, /ze znana jest przeciwprostok/atna (wektor,
% parametr~|c|) i~przyprostok/atna (parametr~|b|).
%% \--------------------------------------------------------------------
primarydef c leg b =
 begingroup save a_; pair a_;
  a_+b/(length(c)+-+b)*(a_ rotated -90)=c; % |(length(c)+-+b)=length(a_)|
  a_
 endgroup
enddef;
%% \--------------------------------------------------------------------
%% This extremely simple macro is particularly
%% useful for constructing sloped objects. Assume, for example, that
%% we want to draw the following parallelogram:
%% \-
%% To pro/sciutkie makro jest szczeg/olnie u/zyteczne przy konstruowaniu
%% uko/snych obiekt/ow. Za/l/o/zmy, /ze chcemy narysowa/c nast/epuj/acy
%% r/ownoleg/lobok:
%% %
%% \LINE{\epsfbox{\illusname.103}}
%% %
%% \descriptioncomments
% (given |h|, |w| and |b|). This is exactly the situation, where
% the macro `leg' comes handy in. Given |z0| and |z2|, the remaining
% points |z1| and |z3| can be easily determined from the following
% relations:
%% \-
%% \descriptioncomments
% dla zadanych wielko/sci |h|, |w| i~|b|. To jest w/la/snie
% ta~sytuacja, w~kt/orej makro ,leg' okazuje si/e u/zyteczne.
% Maj/ac dane punkty |z0| i~|z2|, punkty |z1| i~|z3| wyznaczy/c
% mo/zna z~relacji:
%% %
%% \LINE{%
%% \descriptioncomments
%   |z1=z0+whatever*((z2-z0) leg (-b));|\quad
%   |y1=y2;|\quad |z1-z2=z0-z3;|
%% \unskip}
%% %
%% Note the minus preceding the second argument to~the~`leg';
%% the positive value means ``leftwards,'' negative---``rightwards''
%% (with respect to hypotenuse vector).
%% \-
%% Odnotujmy obecno/s/c minusa przed drugim argumentem makra ,leg';
%% warto/s/c dodatnia oznacza ,,po~lewej'', ujemna~--~,,po prawej''
%% (wzgl/edem wektora przeciwprostok/atnej).
%% \--------------------------------------------------------------------
%% \medskip
%% \--------------------------------------------------------------------
%% {\descriptioncomments
% The macro |quicksort| sorts |@#||s.i ... @#||s.j| along with
% |@#|.|$i ... @#|.|$j| for |$| $\in$ |t|, using Tony Hoare's ``quick sort''
% method; suffix |s| must must not occur in the |t| list (no checking
% is performed); if both |s| and |t| are empty, |t| is ignored.
%% }
%% \bull Remark 1: the algorithm has no explicit recursion, because of
%%  \MF{}//\MP{} limits on recursion level.
%% \bull Remark 2: the algorithm is not stable, i.e., it does not
%%  preserve the order of equal items.
%% \bull {\descriptioncomments
%    Sample usage: |quicksort| |A(1,100)()(x,y)| will sort |A1|,
%    |A2,...|$\,$|,A100| (comparing |A.i| with |A.j|) and, moreover,
%    |A.x1, A.y1,...|$\,$|,A.x100, A.y100| will be reordered simultaneously.
%% }
%% \-
%% {\descriptioncomments
% Makro |quicksort| sortuje |@#||s.i ... @#||s.j| wraz
% z~|@#|.|$i ... @#|.|$j| dla |$| $\in$ |t|, z~u/zyciem algorytmu
% ``quick sort'', kt/orego autorem jest Tony Hoare;
% sufiks |s| nie mo/ze wyst/api/c w~li/scie |t| list (za/lo/zenie to
% nie jest sprawdzane); je/sli parametry |s| i~|t| s/a r/ownocze/snie
% puste, parametr |t| ignorowany.
%% }
%% \bull Uwaga 1: algorytm nie korzysta z~jawnej rekursji ze wzgl/edu
%%  na ograniczenia implementacyjne \MF{}//\MP{}.
%% \bull Uwaga 2: algorytm jest niestabilny, tzn. nie zachowuje
%%  kolejno/sci r/ownych obiekt/ow.
%% \bull {\descriptioncomments
%    Przyk/ladowe u/zycie: |quicksort| |A(1,100)()(x,y)| posortuje |A1|,
%    |A2,...|$\,$|,A100| (por/ownuj/ac |A.i| z~|A.j|), ponadto
%    |A.x1, A.y1,...|$\,$|,A.x100, A.y100| zostan/a r/ownocze/snie
%    odpowiednio przestawione.
%% }
%% \--------------------------------------------------------------------
vardef quicksort@#(expr i,j)(suffix s)(text t) =
 save i_,j_,k_,l_,cell_,stack_,incl_t_; boolean incl_t_;
 pair stack_[\\]; stack_.lev:=0; stack_[incr stack_.lev]:=(i,j);
 i_:=0; for $:=t: i_:=i_+1; endfor % ``measure'' |t|-list
 incl_t_:=(str s <> "") or ((str s = "") and (i_<>0));
 forsuffixes $:= s if incl_t_: , t fi:
  if numeric @#.$[i]: numeric cell_.$;
  elseif string @#.$[i]: string cell_.$;
  elseif boolean @#.$[i]: boolean cell_.$;
  fi
 endfor
 forever:
 exitif stack_.lev<=0;
  numeric i_,j_; (i_,j_)=stack_[stack_.lev]; stack_.lev:=stack_.lev-1;
  if i_<j_:
   forsuffixes $:= s if incl_t_: , t fi: cell_.$:=@#.$[i_]; endfor
   l_:=i_;
   for k_:=i_+1 upto j_:
    if is_less(@#.s[k_],cell_.s):
     forsuffixes $:=s if incl_t_: , t fi:
      @#.$[l_]:=@#.$[k_]; @#.$[k_]:=@#.$[l_+1];
     endfor
     l_:=l_+1;
    fi
   endfor
   forsuffixes $:= s if incl_t_: , t fi: @#.$[l_]:=cell_.$; endfor
   stack_[incr stack_.lev]:=(i_,l_-1); stack_[incr stack_.lev]:=(l_+1,j_);
  fi
 endfor
enddef;
vardef is_less(expr a,b) = (a<b) enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The macro |soften_path| rounds all corners of a path |p|;
% |r| is the radius. Use |soften_nodes| for rounding corners at
% a given set of nodes; its text parameter |t| is a comma-separated
% list of either numbers or pairs: a number means the number
% of a node, a pair means the number of a node and a local
% radius, to be used instead of~|r|; prior to insertion
% the list of nodes is sorted.
%% \-
%% \descriptioncomments
% Macro |soften_path| zaokr/agla naro/za /scie/zki |p|;
% |r|~oznacza promie/n. Aby zaokr/agli/c naro/za w~wybranych w/ez/lach
% nale/zy u/zy/c makra |soften_nodes|; parametr tekstowy~|t| tego
% makra jest list/a (separowan/a przecinkami) liczb lub par:
% liczba oznacza numer w/ez/la, para~-- numer w/ez/la i~lokalny
% promie/n zaokr/aglenia (zamiast~|r|); lista w/ez/l/ow przed
% wstawieniem jest sortowana.
%% \--------------------------------------------------------------------
vardef soften_node(expr p,r,t) = % path, radius, node (i.e., time)
 save q_; path q_; interim join_radius:=r;
 if cycle p:
  q_=(subpath (t-1,t) of p) softjoin (subpath (t,t+length(p)-1) of p) & cycle;
   (subpath(1-t, 1+length(q_)-t) of q_) & cycle % re-position origin
 else: (subpath (0,t) of p) softjoin (subpath (t,length(p)) of p) fi
enddef;
%
vardef soften_nodes(expr p,r) (text t) =
 save j_, n_, p_, r_, t_; path p_; p_:=p;
 t_:=0; for i_:=t: (n_[incr t_],r_[t_])=if pair i_: i_ else: (i_,r) fi; endfor
 quicksort(1,t_)(n_)(r_);
 j_:=-1; for i_:=1 upto t_: p_:=soften_node(p_,r_[i_],n_[i_]+incr j_); endfor;
 p_
enddef;
%
vardef soften_path(expr p,r) = % path, radius
 save p_; path p_; p_:=p;
 if r>0:
  for i_:=if cycle p: 0 else: 1 fi step 2 until 2(length(p)-1):
   p_:=soften_node(p_,r,i_);
  endfor;
 fi
 p_
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The macro |insert_nodes| inserts additional nodes at given non-integer
% non-repeating times~|t| into a given path |p|.
% The code would be a bit longer without `|arclength|' and `|arctime|.'
% The macro can be useful in some cases in the context of finding
% the envelopes of pen-stroked paths (avoiding inflection
% points---see below).
%% \-
%% \descriptioncomments
% Macro |insert_nodes| wstawia w~/scie/zce~|p| dodatkowe
% w/ez/ly w~punktach odpowiadaj/acych czasom~|t| (nieca/lkowitym,
% niepowtarzaj/acym si/e). Bez funkcji ,|arclength|' i~,|arctime|'
% kod by/lby nieco d/lu/zszy. Makro to mo/ze by/c przydatne przy
% wyznaczaniu obrysu pi/orka (unikanie punkt/ow przegi/ecia -- p.~ni/zej).
%% \--------------------------------------------------------------------
vardef insert_nodes(expr p)(text t) =
 save j_, p_, s_, t_; path p_; p_:=p;
 t_:=0;
 for i_:=t:
  if round(i_)<>i_: % ignore integer times
   t_[incr t_]=arclength(subpath(0,i_ mod length(p_)) of p_);
  fi
 endfor
 for i_:=1 upto t_:
  s_:=arctime t_[i_] of p_;
  if abs(round(s_)-s_)>eps: % ignore repeating times; is |eps| OK?
   p_:=(subpath (0, s_) of p_) && (subpath (s_,length p_) of p_)
    if cycle p_: & cycle fi;
  fi
 endfor;
 p_
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The macro |delete_nodes| removes, as the name suggests, selected nodes
% from a given (cyclic) path. The macro can be useful for removing
% superfluous nodes, e.g., in case of improving fonts converted
% from PFB to \MP{}. The nodes can be removed in three possible
% ways: with both control nodes, with the precontrol node, or with
% the postcontrol one.
% During the process of removal, additional control
% nodes may be removed. More precisely: given a path |p|, let
% |z_[i_]| denothes its |i_|-th node, |z_[i_]b|---the respective
% precontrol node (``before''), |z_[i_]a|---the respective postcontrol
% node (``after''). Macro |delete_nodes| removes elements (by assigning
% an undefined value) from the tables |z_[\\]|, |z_[\\]b| and |z_[\\]a|
% in such a way that the following invariant holds for the main loop:
% for any pair of consecutive known nodes |z_[i_]| and |z_[j_]|,
% |i_<j_|, there exist exactly two indices |u_| and |v_| such that
% |i_<=u_<v_<=j_| and both |z_[u_]a| and |z_[v_]b| are known; moreover,
% |z_[w_]a| and |z_[w_]b| are unknown for the remaining indices |w_|,
% |i_<=w_<=j_|. The resulting path is constructed from the elements
% that remain in the table.\break
% Nodes to be removed are passed as the list of pairs
% (text parameter |node_list|):
% |(index,kind)|, where |index| denotes the time of
% the path corresponding to a given node, and |kind|
% is a number. If |kind=0|, both control nodes are to be removed;
% if~|kind<0|, a~precontrol node is to be removed;
% if~|kind>0|, a~postcontrol node is to be removed.\break
% The figure below shows the results of the |delete_nodes|
% applied to a sample path |p| (|p=fullcircle|): the topmost picture depicts
% the source path and the numbering of nodes, the left lower picture
% is the path returned by
% |delete_nodes(p)((1,-1), (3,-1), (5,-1), (7,-1))|
% middle lower one---by
% |delete_nodes(p)((1,0), (3,0), (5,0), (7,0))|,
% right lower one---by
% |delete_nodes(p)((1,1), (3,1), (5,1), (7,1))|.
%% \-
%% \descriptioncomments
% Makro |delete_nodes|, jak sama nazwa wskazuje, usuwa wskazane w/ez/ly
% z~danej (cyklicznej) /scie/zki. Makro mo/ze si/e przyda/c do usuwania
% zb/ednych w/ez/l/ow, na przyk/lad przy poprawianiu font/ow zamienionych
% z~postaci PFB na posta/c \MP{}-ow/a. W/ez/ly s/a usuwane na trzy mo/zliwe
% sposoby: wraz z~obydwoma przyleg/lymi naci/agami, z~poprzedzaj/acym
% lub z~nast/epuj/acym naci/agiem. W~ka/zdym z~przypadk/ow mog/a zosta/c
% te/z usuni/ete s/asiaduj/ace naci/agi.
% Dok/ladniej: dla danej /scie/zki |p| niech |z_[i_]| oznacza |i_|-ty w/eze/l,
% |z_[i_]b| -- jego naci/ag poprzedzaj/acy, |z_[i_]a| -- jego naci/ag
% nast/epuj/acy. Makro |delete_nodes| usuwa elementy (poprzez nadanie
% warto/sci nieokre/slonej) z~tablic |z_[\\]|, |z_[\\]b|
% i~|z_[\\]a| w~taki spos/ob, by zachowany by/l nast/epuj/acy
% niezmiennik: dla dowolnej pary s/asiaduj/acych w/ez/l/ow
% |z_[i_]| i~|z_[j_]|, |i_<j_|, istniej/a dok/ladnie dwa indeksy
% |u_| i~|v_|, takie /ze |i_<=u_<v_<=j_| i~zar/owno |z_[u_]a|,
% jak i~|z_[v_]b| s/a znane; ponadto |z_[w_]a| i~|z_[w_]b| s/a
% nieokre/slone dla pozosta/lych indeks/ow~|w_|, |i_<=w_<=j_|.
% Z element/ow, kt/ore pozostaj/a w~tablicy, budowana jest
% /scie/zka wynikowa.\break
% W/ez/ly, kt/ore maj/a by/c usuni/ete, s/a podawane jako lista par
% (parametr tekstowy |node_list|): |(indeks,rodzaj)|, gdzie |indeks| oznacza
% czas odpowiadaj/acy danemu w/ez/lowi na /scie/zce, a~|rodzaj|
% jest liczb/a; je/sli |rodzaj=0|, to usuwane s/a oba naci/agi,
% je/sli |rodzaj<0|, to usuwany jest naci/ag poprzedzaj/acy,
% je/sli |rodzaj>0|, to usuwany jest naci/ag nast/epuj/acy.\break
% Efekt dzia/lania makra dla przyk/ladowej /scie/zki |p| (|p=fullcircle|)
% jest przedstawiony na poni/zszym rysunku: g/orna ilustracja przedstawia
% /scie/zk/e /xr/od/low/a z~numeracj/a w/ez/l/ow, lewa dolna ilustracja
% to rezultat u/zycia operacji
% |delete_nodes(p)((1,-1), (3,-1), (5,-1), (7,-1))|
% /srodkowa dolna -- operacji
% |delete_nodes(p)((1,0), (3,0), (5,0), (7,0))|,
% prawa dolna -- operacji
% |delete_nodes(p)((1,1), (3,1), (5,1), (7,1))|.
%% %
%% \LINE{\vbox{\kern3mm\hbox{\epsfbox{\illusname.104}}}}
%% \--------------------------------------------------------------------
vardef delete_nodes(expr p)(text node_list) = % |p| is cyclic
 save o_,i_,j_,j__,l_,n_,z_; pair z_[\\],z_[\\]a,z_[\\]b;
 n_=length(p);
 for i_:=0 upto n_:
   z_[i_]:=point i_ of p;
   z_[i_]a:=postcontrol i_ of p;
   z_[i_]b:=precontrol i_ of p;
 endfor
 for l_:=node_list:
  % here the above-mentioned invariant holds (the result may depend
  % on the order of the nodes to be deleted, if neighbouring nodes
  % are being deleted)
  i_:=xpart(l_) mod n_; % to |mod| or not to |mod|?
  % to ignore (with a |message|) or to apply the |mod| operation?
  z_[i_]:=whatever_pair;
  if ypart(l_)=0: % delete predecessing |b|-node and successing |a|-node
   j_:=i_; forever: exitif known z_[j_]b; j_:=(j_-1) mod n_; endfor
   z_[j_]b:=whatever_pair;
   j_:=i_; forever: exitif known z_[j_]a; j_:=(j_+1) mod n_; endfor
   z_[j_]a:=whatever_pair;
  elseif ypart(l_)>0: % delete successing |a|-node and |b|-node
   j_:=i_; forever: exitif known z_[j_]a; j_:=(j_+1) mod n_; endfor
   z_[j_]a:=whatever_pair;
   j_:=i_; forever: j_:=(j_+1) mod n_; exitif known z_[j_]b; endfor
   z_[j_]b:=whatever_pair;
  else: % |ypart(l_)<0|; delete predecessing |a|-node and |b|-node
   j_:=i_; forever: j_:=(j_-1) mod n_; exitif known z_[j_]a; endfor
   z_[j_]a:=whatever_pair;
   j_:=i_; forever: exitif known z_[j_]b; j_:=(j_-1) mod n_; endfor
   z_[j_]b:=whatever_pair;
  fi
 endfor
 i_:=0; forever: exitif known z_[i_]; i_:=i_+1; endfor; o_:=i_;
 for i_:=o_ upto n_-1+o_:
  hide(j_:=i_ mod n_; j__:=(i_+1) mod n_)
  if known z_[j_]: z_[j_] fi
  if known z_[j_]a: .. controls z_[j_]a fi
  if known z_[j__]b: and \\ z_[j__]b .. fi
 endfor \\ z_[o_] & cycle
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The macros |insert_extreme| and |insert_extremes| insert additional
% nodes at extremes into a given path |p|. They make use of |unslant_stroke|
% operation in order to provide valid extremes after slanting the path~|p|.
% The first parameter (optional, of type |text|, i.e, it the list
% of numbers or pairs) defines either the minimal acceptable length
% of a~resulting subpath (if its value is of the |numeric| type) or
% a~subpath to be excluded from the process of the insertion of extremes
% (if its value is of the |pair| type).
%% \-
%% \descriptioncomments
% Makra |insert_extreme| i~|insert_extremes| wstawiaj/a dodatkowe w/ez/ly
% w~ekstremach w~/scie/zce~|p|. Makra robi u/zytek z~operacji |unslant_stroke|
% aby zapewni/c w/la/sciwe po/lo/zenie ekstrm/ow po pochyleniu s/cie/zki~|p|.
% Pierwszy, opcjonalny parametr (typu |text|; tzn. jest to lista liczb lub
% par) pozwala poda/c d/lugo/s/c minimalnej akceptowalnej (wynikowej)
% pod/scie/zki oraz pod/scie/zki nieuwzgl/edniane przy wstawianiu
% ekstrem/ow; decyduje o~tym typ warto/sci parametru: |integer|
% oznacza d/lugo/s/c, |pair|~-- pod/scie/zk/e.
%% \--------------------------------------------------------------------
vardef insert_extremes(text opt)(expr p) = % far from being optimal...
 save p_; path p_;
 p_:=insert_extreme(opt)(up)(p);
 p_:=insert_extreme(opt)(left)(p_);
 p_:=insert_extreme(opt)(down)(p_);
 insert_extreme(opt)(right)(p_)
enddef;
%
vardef insert_extreme(text opt)(expr d,p) =
 save ignored_size_,ignored_segments_,a_,b_,found_,p_,t_,t__; path p_;
 ignored_size_:=ignore_nib_limit;
 for opt_:=opt:
  if numeric opt_: ignored_size_:=opt_; fi
  if pair opt_:
   a_:=floor (xpart opt_); b_:=ceiling (ypart opt_)-1; if b_<a_: b_:=a_; fi
   for t_:=a_ upto b_: ignored_segments_[t_]:=1; endfor
  fi
 endfor
 for t_:=0 upto length(p)-1:
  hide(found_:=whatever)
  if unknown ignored_segments_[t_]:
   hide (p_:=subpath (t_,t_+1) of p)
   if arclength(p_)>ignored_size_:
    hide(t__:=directiontime d unslant_stroke of p_)
    if (arclength(subpath (0,t__) of p_)>ignored_size_) and
       (arclength(subpath (t__,1) of p_)>ignored_size_): hide(found_:=1)
    fi
   fi
  fi
  if known found_: ((subpath (0,t__) of p_) && (subpath (t__,1) of p_)) else: p_ fi
  &
 endfor
 if cycle p: cycle fi
enddef;
%% \vfill\eject
%% \--------------------------------------------------------------------
%% \centering \bf A MODULE THAT FINDS AN~OUTLINE FOR
%% A SINGLE (SELF-INTERSECTING) CYCLIC PATH
%% OR~A~PAIR OF~CYCLIC~PATHS
%% \-
%% \centering \bf MODU/L ZNAJDUJ/ACY OBWIEDNI/E POJEDYNCZEJ
%% /SCIE/ZKI CYKLICZNEJ (SAMOPRZECINAJ/ACEJ SI/E)
%% LUB PARY /SCIE/ZEK CYKLICZNYCH
%%
%% \LINE{\leaders\hrule\hfill}
%%
%% The problem can be stated as follows: two paths are given (precisely:
%% expressions of type {\bf path}); assume that the positively directed
%% (anti-clockwise) path accomplishes filling, and negatively directed
%% (clockwise)---erasing; the task is to find the outline of the resulting
%% (visible) figure. Such a task is known as ``removing overlaps''
%% which seems too narrow for such a complex operation. Actually,
%% the basic macro of that part, i.e., `find_outlines,' accomplishes
%% set-theory operations: sum, difference and product, depending on the
%% turning number of the input paths. The illustration below demonstrates
%% the results yielded by the macro `find_outlines.' There are four
%% cases since there are four combinations of turning numbers for two
%% ``regular'' paths. Each case shows the initial situation (left)
%% and the resulting one (right). Filling is omitted, the outline colour
%% shows the turning number: blue---positive, red---negative.
%% \-
%% Problem mo/zna postawi/c w~nast/epuj/acy spos/ob: dane s/a dwie /scie/zki
%% (dok/ladniej wyra/zenia typu {\bf path}); zak/ladamy, /ze dodatnio
%% skierowane /scie/zki (przeciwnie do ruchu wskaz/owek zegara) zaczerniaj/a
%% obszar, a~ujemnie -- odczerniaj/a. Nale/zy znale/x/c obwiedni/e
%% tak powsta/lej (widocznej) figury. Operacja ta nosi nazw/e
%% ,,usuwanie cz/e/sci wsp/olnej'', co niezbyt dobrze oddaje z/lo/zony
%% charakter operacji. W~istocie podstawowa operacja tego modu/lu,
%% tj.~,find_outlines', realizuje operacje teoriomnogo/sciowe:
%% sum/e, iloczyn i~r/o/znic/e, w~zale/zno/sci od kierunk/ow wej/sciowych
%% /scie/zek. Poni/zsza ilustracja przedstawia wyniki dzia/lania makra
%% ,find_outlines'. Ka/zdy z~czterech przypadk/ow pokazuje stan
%% pocz/atkowy (lewa strona) i~ko/ncowy (prawa strona). Wype/lnienie nie
%% zosta/lo naniesione, zaznaczony jedynie zosta/l kierunek /scie/zek: kolor
%% niebieski -- kierunek dodatni, kolor czerwony -- kierunek ujemny.
%% %
%% \LINE{\epsfbox{\illusname.105}}
%% %
%% \descriptioncomments
% A single (cyclic) curve can be supplied as an input argument to
% |find_outlines|; in this case it {\it should have\/} self-intersections.
% Depending on the orientation of the input path, there are possible
% two sets of resulting paths:
%% \-
%% \descriptioncomments
% Argumentem wej/sciowym makra |find_outlines| mo/ze by/c pojedyncza
% (cykliczna) /scie/zka; w takim przypadku {\it powinna\/} ona mie/c
% samoprzeci/ecia. Makro |find_outlines| -- w~zale/zno/sci od kierunku
% wej/sciowej /scie/zki -- znajduje dwa mo/zliwe zestawy /scie/zek
% wynikowych:
%% %
%% \LINE{\epsfbox{\illusname.106}}
%% \--------------------------------------------------------------------
vardef feasible_cross(suffix p,q,v)(expr c,s) =
 if v[c]: (s*turn_ang(gendir p[c] of p, gendir q[c] of q)>0)
 else: false fi
enddef;
%
vardef recombine(expr self_intersection)(suffix p, r) =
 save s_,e_,v_,n_; boolean v_[\\];
 if not path r0: scantokens("path " & generisize(str r) & "[]"); fi
 if not numeric r.num: scantokens("numeric " & generisize(str r.num); fi
 r.num:=0;
 s_:=if self_intersection: 1 else: turningnumber(p1)*turningnumber(p2) fi;
 for i_:=1 upto p.num: v_[i_]:=true; endfor
 forever:
  save c_; c_:=0;
  forever:
   c_:=c_+1; exitif c_>p.num; exitif feasible_cross(p1,p2,v_,c_,s_);
  endfor
  exitif c_>p.num;
  e_:=1;
  r[incr r.num]:=
   forever:
    hide(e_:=3-e_; v_[c_]:=false;
    if self_intersection: % identify the same crossings as ``visited''
     for i_:=1 upto p.num:
      % |intersectiontime| is not a comutative operation:
      % |1epsilon|? |2epsilon|? double precision; excludes notation <number>|epsilon|
      if abs(p[e_][c_]-p[3-e_][i_])<=(16*epsilon):
       v_[i_]:=false;
      fi
     endfor
    fi
    n_:=next_time(p[e_])(c_))
    (pos_subpath (p[e_][c_],p[e_][n_]) of p[e_]) hide(c_:=n_) &&
    exitif not v_[n_];
   endfor
   cycle;
 endfor
enddef;
%
vardef next_time(suffix p)(expr t) =
 save c_;
 for i_:=1 upto p.num:
  if (p[i_]>p[t]):
   if known c_: if p[i_]<p[c_]: c_:=i_; fi else: c_:=i_; fi
  fi
 endfor
 if unknown c_:
  c_=1; for i_:=2 upto p.num: if p[i_]<p[c_]: c_:=i_; fi endfor
 fi
 c_
enddef;
%
vardef feasible_time(suffix p)(expr t) =
 save b_,i_; boolean b_; b_:=true; i_:=0;
 forever:
  i_:=i_+1;
  exitif (unknown p[i_]) or (not b_);
  b_:=b_ if (abs(p[i_]-t)<1) or (abs(p[i_]-t)>length(p)-1): % optimization?
   and (arclength( pos_subpath(p[i_],t) of p ) > acc_eps)
   and (arclength( pos_subpath(t,p[i_]) of p ) > acc_eps)
  fi;
 endfor
 b_
enddef;
%
vardef intersect_curves(expr self_intersection)(suffix p) =
 save l_,p_; l_:=0;
 for i_:=0 upto length(p1)-1:
  for j_:=0 upto length(p2)-1:
% if a curve is being self-intersected, we demand that its neighbouring
% B\'ezier segments do not intersect (could be circumvent at the cost
% of the increased complexity of computation):
   if if self_intersection: (abs(i_-j_) mod (length(p1)-1))>1 else: true fi:
   for k_:=1 upto
    intersect_segments(subpath (i_,i_+1) of p1, subpath (j_,j_+1) of p2)(p_):
% assuming that there are no self-intersections of single B\'ezier segments,
% it suffices to check feasibility only for |p1|:
    if feasible_time(p1, p_1[k_]+i_):
     p1[incr l_]=p_1[k_]+i_; p2[l_]=p_2[k_]+j_;
    fi
   endfor
   fi
  endfor
 endfor
 p.num:=p1num:=p2num:=l_;
enddef;
%
vardef intersect_segments(expr a,b)(suffix p) =
 save ta_,tb_; (ta_,tb_)=a intersectiontimes b;
 if ta_>=0:
  p1[1]:=ta_; p2[1]:=tb_;
  save tc_,td_; (tc_,td_)=reverse a intersectiontimes reverse b;
  if length(1/2[point ta_ of a, point tb_ of b]
   -1/2[point tc_ of reverse a, point td_ of reverse b])>acc_eps:
   p1[2]:=1-tc_; p2[2]:=1-td_; 1+ \\ fi \\ 1
 else: 0 fi
enddef;
newinternal acc_eps; acc_eps:=.5;
%% \--------------------------------------------------------------------
%% As was mentioned, the input argument to `find_outlines' can be either
%% a single path or a pair of paths. The paths must comply with
%% the following assumptions:
%% \bull paths are cyclic;
%% \bull if two paths are passed as an argument, each of them should
%% contain no self-intersection;
%% \bull if a single path is passed as an argument, its adjacent segments
%% do not intersect;
%% \bull no tangent touching occur;
%% \bull no inflection points occur (because the applied algorithm
%% assumes that two B\'ezier segments can cross at at most two points)
%% \bull segments are long enough (minimal length of a segment after the
%% process of intersection is controlled by the variable
%% {\descriptioncomments
% |acc_eps|---see above).
%% }
%% \-
%% Jak zosta/lo wspomniane, wej/sciowym argumentem makra ,find_outlines'
%% mo/ze by/c albo pojedyncza /scie/zka, albo para /scie/zek.
%% Nast/epuj/ace warunki musz/a by/c spe/lnione:
%% \bull /scie/zki powinny by/c cykliczne
%% \bull je/sli argumentem jest para /scie/zek, /zadna z~nich nie powinna
%% mie/c punkt/ow samoprzeci/ecia;
%% \bull je/sli argumentem jest pojedyncza /scie/zka, to jej s/asiednie
%% segmenty B\'eziera nie powinny si/e przecina/c;
%% \bull nie powinny wyst/epowa/c punkty styczno/sci;
%% \bull nie powinny wyst/epowa/c punkty przegi/ecia (gdy/z
%% zastosowany algorytm zak/lada, /ze dwa segmenty B\'eziera
%% przecinaj/a si/e co najwy/zej w~dw/och punktach);
%% \bull poszczeg/olne segmenty powinny by/c dostatecznie d/lugie (minimalna
%% d/lugo/s/c segmentu po procesie znajdowania przeci/e/c jest okre/slona
%% {\descriptioncomments
% przez zmienn/a |acc_eps| -- p.~wy/zej).
%% }
%% \LINE{}
%% Further improvements:
%% \bull intersection points nearly coinciding with
%%    nodes should be replaced by the nodes, i.e., by an integer time.
%% \-
%% Przewidywane udoskonalenie:
%% \bull je/sli punkt przeci/ecia niemal/ze pokrywa si/e z~w/ez/lem
%% kt/orej/s z~krzywych, to do oblicze/n powinien by/c brany ten/ze w/eze/l.
%% \--------------------------------------------------------------------
vardef find_outlines(text a)(suffix r) = % |a| -- input, |r| -- output
 save auto_,i_,q_;
 boolean auto_; numeric q_.num; numeric q_[\\][\\]; path q_[\\];
 i_:=0;
 for a_:=a: q_[incr i_]:=a_; endfor
 if i_>2: % presumably, a user never tries to intersect no paths
  errhelp "I'll ignore superfluous paths.";
  errmessage "PX: too many paths (" & decimal(i_) & ")";
 fi
 auto_:=unknown q_2; if auto_: q_2=q_1; fi;
 intersect_curves(auto_,q_);
 if q_.num=0: % emergency?
  if not path r[0]: scantokens("path " & generisize(str r) & "[]"); fi
  if not numeric r.num: scantokens("numeric " & generisize(str r.num); fi
  if auto_: r.num:=-1; r1:=q_1;
  else: r.num:=-2; r1:=q_1; r2:=q_2; fi
 else: recombine(auto_,q_,r); fi
enddef;
%% \vfill\eject
%% \--------------------------------------------------------------------
%% \centering \bf A MODULE THAT FINDS AN~ENVELOPE OF A PATH BEING DRAWN
%% WITH AN ELLIPTICAL OR A ONE-DIMENSIONAL (``RAZOR'') PEN
%% \-
%% \centering \bf MODU/L ZNAJDUJ/ACY OBRYS OBSZARU ZAMALOWYWANEGO
%% PRZEZ PI/ORKO ELIPTYCZNE LUB JEDNOWYMIAROWE (,,/ZYLETKOWE'')
%%
%% \LINE{\leaders\hrule\hfill}
%%
%% \descriptioncomments
% The following macros approximate the envelope of an elliptical or a razor
% pen. The exact solution is impossible---in general, the envelope is not
% a B\'ezier curve, therefore some heuristics is, in general, unavoidable.
% We assumed that the backbone of a figure is such that
% the envelope does not form loops at smoothly joined nodes. Moreover,
% all B\'ezier segments appearing in the process {\bf should not}
% contain inflection points (the reason for this limitation is the
% method of finding an approximation of a pen envelope). If the latter
% condition is not fulfilled, one may expect weird results (see the usage
% of the |...| operator in the code of |pen_stroke_edge|).
%% \-
%% \descriptioncomments
% Poni/zsze makra przybli/zaj/a brzeg /scie/zki kre/slonej eliptycznym lub
% ,,/zyletkowym'' pi/orkiem. Dok/ladne rozwi/azanie nie jest mo/zliwe~--
% w~og/olno/sci brzeg nie jest krzyw/a B\'eziera, zatem heurystyki
% w~og/olno/sci unikn/a/c si/e nie da. Za/lo/zyli/smy, /ze szkielet
% figury jest tak skonstruowany, /ze przy g/ladko po/l/aczonych w/ez/lach
% kraw/ed/x pi/orka nie rysuje p/etli. Ponadto krzywe pojawiaj/ace si/e
% w~trakcie przetwarzania {\bf nie~powinny~mie/c} punkt/ow przegi/ecia (co
% wi/a/ze si/e z~zastosowanym sposobem aproksymacji obrysu pi/orka). Je/sli
% to za/lo/zenie nie jest spe/lnione, mo/zna oczekiwa/c dziwacznych efekt/ow
% (p.~u/zycie operatora |...| w~kodzie makra |pen_stroke_edge|).
%% \--------------------------------------------------------------------
%% \bigskip
%% \--------------------------------------------------------------------
%% \descriptioncomments
% We assume that slanting should not distort a pen. Therefore, if
% a glyph is to be slanted {\it after\/} expanding a stroke, which
% usually is the case, the envelope should be constructed with
% an {\it unslanted pen}. Macros |slant_stroke|, |unslant_stroke|,
% and |unslant_angle| are devised to facilitate handling this
% situation. These macros refer to the variable |slant_stroke_val|;
% it should be assigned a definite value prior to expanding stroke.
%% \-
%% \descriptioncomments
% Zak/ladamy, /ze pochylenie ({\it slanting\/}) nie powinno wp/lywa/c
% na kszta/lt pi/orka. Zatem je/sli obrys konstruujemy w~taki spos/ob,
% /ze pochylenie jest wykonywane po wyznaczeniu obrysu pi/orka, co
% zwykle ma miejsce, to obrys powinnien by/c znajdowany dla pi/orka
% poddanego pochyleniu odwrotnemu ({\it unslanting\/}).
% Makra |slant_stroke|, |unslant_stroke| oraz |unslant_angle|
% zosta/ly wprowadzone po to, aby u/latwi/c obs/lug/e takiego zabiegu.
% Zmiennej |slant_stroke_val|, do kt/orej te makra si/e odwo/luj/a,
% nale/zy nada/c stosown/a warto/s/c przed wyznaczaniem obrysu pi/orka.
%% \--------------------------------------------------------------------
def slant_stroke =
 if known slant_stroke_val: slanted slant_stroke_val fi
enddef;
def unslant_stroke =
 if known slant_stroke_val: slanted -slant_stroke_val fi
enddef;
vardef unslant_angle(expr a) = angle(dir(a) unslant_stroke) enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% Macro |fix_nib| returns a path. If |y_diam| parameter
% is~0, a ``razor'' pen (a segment) is returned, otherwise it is
% an approximation of an ellipse. We do our best to avoid unnecessary
% nodes, hence the approximation is somewhat complicated; another reason
% for the complication is that interpolation and affine transformations
% do not commute, therefore the appropriate nodes are found for
% the untransformed pen, and only then the pen is transformed.
% {\it Note\/}: So far, there is no explicit relation between a built-in
% \MP{} pen mechanism and the |fix_nib| operation, in particular,
% |beginfig| does not alter the setting of |default_nib|. Needs rethinking.
%% \-
%% \descriptioncomments
% Makro |fix_nib| zwraca /scie/zk/e. Je/sli parametr |y_diam|
% jest r/owny~0, zwracane jest pi/orko ,,/zyletkowe'' (odcinek),
% w~przeciwnym razie wynikiem jest (przybli/zona) elipsa. Poniewa/z
% chcemy w~miar/e mo/zliwo/sci unika/c zb/ednych w/ez/l/ow, konstrukcja
% przybli/zenia jest nieco skomplikowana. Dodatkowym czynnikiem komplikuj/acym
% jest to, /ze interpolacja nie jest przemienna wzgl/edem przekszta/lce/n
% afinicznych, dlatego najpierw wyznaczane s/a stosowne w/ez/ly na
% niezdeformowanym pi/orku, a dopiero potem pi/orko jest przekszta/lcane.
% {\it Uwaga\/}: Nie ma bezpo/sredniego powi/azania mi/edzy operacj/a
% |fix_nib| a~wbudowanym w~\MP{}-a mechanizmem pi/orek, w~szczeg/olno/sci
% |beginfig| nie zmienia ustawienia |default_nib|. Rzecz wymaga przemy/slenia.
%% \--------------------------------------------------------------------

vardef fix_nib(expr x_diam, y_diam, rot_angle) =
 if (x_diam<>0) and (y_diam<>0): fix_elliptic_nib(x_diam, y_diam, rot_angle)
 elseif (x_diam<>0) and (y_diam=0): fix_razor_nib(x_diam, rot_angle)
 elseif (x_diam=0) and (y_diam<>0): fix_razor_nib(y_diam, rot_angle+90)
 else:
  errhelp "I'll use the default pen, but I'd suggest to cancel the job.";
  errmessage "PX: the null pen is not alowed";
  default_nib
 fi
enddef;

vardef fix_razor_nib(expr x_diam, rot_angle) =
 ((-1/2x_diam,0)--(1/2x_diam,0)) rotated rot_angle unslant_stroke
enddef;

vardef fix_elliptic_nib(expr x_diam, y_diam, rot_angle) =
 save p_; path p_;
 % construct a temporary ellipse:
 p_:=fullcircle
  xscaled x_diam yscaled y_diam rotated rot_angle unslant_stroke;
 % construct an elliptic pen path having
 % 4 or, if necessary (heuristic), 6 nodes:
 (for d=up unslant_stroke, left,
  if (y_diam/x_diam<1/2) and (abs(rot_angle mod 90)>5):
    left rotated rot_angle unslant_stroke,
  fi
  down unslant_stroke, right,
  if (y_diam/x_diam<1/2) and (abs(rot_angle mod 90)>5):
    right rotated rot_angle unslant_stroke
  fi:
  (point(directiontime d of p_) of fullcircle)
   {direction (directiontime d of p_) of fullcircle}...
 endfor cycle) xscaled x_diam yscaled y_diam rotated rot_angle unslant_stroke
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% Arcs of a pen shorter than |ignore_nib_limit| will be joined together
% to form larger ones. Remember to adjust the parameter |ignore_nib_limit|
% if the size of |default_nib| is significantly changed.
%% \-
%% \descriptioncomments
% /Luki pi/orka kr/otsze ni/z |ignore_nib_limit| zostan/a po/l/aczone
% w~wi/eksze segmenty. Nale/zy pami/eta/c o~zmianie parametru
% |ignore_nib_limit| przy znacz/acej zmianie rozmiaru pi/orka
% (|default_nib|).
%% \--------------------------------------------------------------------
newinternal ignore_nib_limit; ignore_nib_limit:=5;

path default_nib;
default_nib:=fix_nib(50,50,0); % hundred times as large as a default plain pen

newinternal default_elongation, default_join, default_cap;
default_elongation:=1/2;
default_join:=1;
  % 0 -- tip, default elongation used
  % 1 -- pen join, default elongation ignored
  % 2 -- tip, default elongation ignored, elongation=0 used
default_cap:=1;
  % 0 -- cut 90 rel
  % 1 -- pen end
%% \--------------------------------------------------------------------
%% \descriptioncomments
% |tangent_point|, |pen_join|, |pen_stroke_edge_|, and |pen_stroke_edge|
% are auxiliary macros, exploited by the main macro, i.e., |pen_stroke|.
%% \-
%% \descriptioncomments
% |tangent_point|, |pen_join|, |pen_stroke_edge_| i~|pen_stroke_edge| to
% makra pomocnicze, u/zyte w~g/l/ownym makrze, tj.~|pen_stroke|.
%% \--------------------------------------------------------------------
vardef tangent_point(expr d,nib) = % |d| -- direction of pen movement
 save a_;
 point if cycle nib: (directiontime d of nib) else:
  hide (a_:=turn_ang(d,(point 1 of nib)-(point 0 of nib)))
  if abs(a_ mod 180)<.1: 1/2 % emergency
  elseif a_<0: 0 else: 1 fi
 fi of nib
enddef;
%
vardef pen_join(expr a,b,c,nib)=
 % deleting superfluous nodes is based on the |arclength| operation
 % which, obviously, is not preserved after slanting,  but let's hope
 % it does not matter (too much)
 save t_, m_, m__, ta_, tb_, p_; path p_;
 m_:=infinity; % will be the minimal length of |nib|'s segment
 for t_:=0 upto 1/2length(nib)-1:
  m__:=arclength(subpath(t_,t_+1) of nib);
  if m__<m_: m_:=m__; fi
 endfor
 if m_<ignore_nib_limit:
  message "PX: the shortest nib segment < ignore_nib_limit (" &
    decimal(m__) & " < " & decimal(ignore_nib_limit) & ")";
 fi
 p_=nib shifted c;
 if cycle nib:
  ta_=directiontime a of p_; tb_=directiontime b of p_;
  p_:=pos_subpath(ta_,tb_) of p_;
  if arclength(p_)>ignore_nib_limit:
   for i_:=0,0:
    p_:=reverse p_; % short segments may appear at both ends
    if length(p_)>1: % optimization
     if arclength(subpath (0,1) of p_)<1/4ignore_nib_limit:
      % cf. the comment concerning |1/4ignore_nib_limit| in
      % |pen_stroke_edge| below
      p_:=(point 0 of p_) .. controls (postcontrol 1 of p_) and
        (precontrol 2 of p_) .. subpath (2,infinity) of p_;
    fi
   fi
   endfor
  else:
   p_:=(point 0 of p_){a}...{b}(point length(p_) of p_);
  fi
 else: % razor nib
  p_:=tangent_point(a,p_)--tangent_point(b,p_);
 fi
 p_
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% The finding of a~pen envelope for a~given B\'ezier segment,
% defined by nodes |a|, |b|, |c|, and |d|, begins with
% the placing the pen at the ends of the B\'ezier segment
% (i.e., at the points |a|, |d|) and finding the corresponding points
% |a'| and |d'| where the pen outline is parrallel to the direction
% of the original path at these points. Then, the outline is constructed.
% For |pen_stroke_method=0| (default), the envelope segment is constructed
% by setting the beginning and final directions (optionally, the direction
% at a given node can be ignored); for |pen_stroke_method=1| or~2
% an alternative (more elaborate) procedure is involved which explicitly
% computes control nodes |b'| and |c'| of the resulting path basing on
% a~heuristic assumption that
% |length(b'-a')/length(b-a)|~$\approx$
% |length(c'-d')/length(c-d)|~$\approx$
% |length(a'-d')/length(a-d)|.\break
% The default method never produce concave edges because the operator |...|
% is used always; the alternative methods employs the operator
% |force_convex_edge| instead; for |pen_stroke_method=1| the convex edges
% are forced (i.e, inflexion points are being removed),
% for |pen_stroke_method=2| no forcing of convex edges takes place.
%% \-
%% \descriptioncomments
% Wyznaczanie brzegu obszaru rysowanego pi/orkiem
% dla segmentu B\'eziera okre/slonego przez w/ez/ly
% |a|, |b|, |c| i~|d|, rozpoczyna si/e od umieszczenia
% pi/orka w~w/ez/lach ko/ncowych (tj.~|a| i~|d|) znalezienia
% odpowiadaj/acych im punkt/ow |a'| i~|d'| w~kt/orych obwiednia
% pi/orka jest r/ownoleg/la do oryginalnej /scie/zki. Nast/epnie
% konstruowana jest kraw/ed/x brzegu obszaru rysowanego pi/orkiem.
% Dla metody domy/slnej (|pen_stroke_method=0|) /scie/zka jest
% budowana na podstawie kierunku pocz/atkowego i~ko/ncowego.
% Dla metody alternatywnej (|pen_stroke_method=1| lub~2) /scie/zka jest
% wyznaczana przez jawne wyliczenie naci/ag/ow
% (|b'|~i~|c'|) na podstawie heurystycznego za/lo/zenia
%  |length(b'-a')/length(b-a)|~$\approx$
%  |length(c'-d')/length(c-d)|~$\approx$
%  |length(a'-d')/length(a-d)|.\break
% Pierwsza z metod (tzn. domy/slna) nie daje w~wyniku /scie/zki wkl/es/lej,
% gdy/z u/zywany jest zawsze operator |...|~; w~wypadku metody alternatywnej
% stosowany jest operator |force_convex_edge|, kt/ory wymusza wypuk/lo/s/c
% (tzn. usuwa punkty przegi/ecia) dla |pen_stroke_method=1|, natomiast
% nie wymusza dla |pen_stroke_method=2|.
%% \--------------------------------------------------------------------
vardef extrapoline expr t of B = % the result may be not a single segment
 save l_, t_;
 (t_.a,t_.b)=t; % |0<=ta_<tb_<=1|!
 l_=arclength(B)/(t_.b-t_.a); l_.a=l_*t_.a; l_.b=l_*(1-t_.b);
 if t_.a>0: ((point 0 of B) - l_.a*(upostdir 0 of B))-- fi
  B
 if t_.b<1:  -- ((point 1 of B) + l_.b*(upredir 1 of B)) fi
enddef;
%
vardef force_convex_edge(expr za, zb, zc, zd) =
 save a_, b_, c_, d_, z_;
 a_:=length(zd-za); b_:=length(zb-za); c_:=length(zc-zb); d_:=length(zd-zc);
 if (-a_+b_+c_+d_ > a_/infinity):
  if pen_stroke_method=2:
   za .. controls zb and zc .. zd
  else:
   if (a_>0.01) and (b_>0.01) and (c_>0.01) and (d_>0.01): % no degeneration...
    a_:=signum((za-zd) rotated -90 dotnorm (zb-za));
    b_:=signum((zb-za) rotated -90 dotnorm (zc-zb));
    c_:=signum((zc-zb) rotated -90 dotnorm (zd-zc));
    d_:=signum((zd-zc) rotated -90 dotnorm (za-zd));
    if ((a_<>b_) or (b_<>c_)) and (a_=d_):
     numeric b_, c_; pair z_;
     z_=b_[za,zb]=c_[zd,zc];
     za .. controls
      if b_<1: z_ else: zb fi and if c_<1: z_ else: zc fi
     .. zd
    else:
     za .. controls zb and zc .. zd
    fi
   else:
    za .. controls zb and zc .. zd
   fi
  fi
 else:
  za -- zd
 fi
enddef;
%
vardef pen_stroke_edge_(expr b,b_nib,e_nib) = % |b| -- B\'ezier segment
 save pa_,pb_,qa_,qb_,ra_,rb_,sa_,sb_;
 pair pa_,pb_,qa_,qb_,ra_,rb_,sa_,sb_;
 pa_=point 0 of b; ra_=(postcontrol 0 of b)-pa_; sa_=postdir 0 of b;
 pb_=point 1 of b; rb_=(precontrol 1 of b)-pb_;  sb_=predir 1 of b;
 qa_=pa_ + tangent_point(sa_, b_nib);
 qb_=pb_ + tangent_point(sb_, e_nib);
 if pen_stroke_method=0:
  qa_ {sa_} ... {sb_} qb_
 elseif (pen_stroke_method=1) or (pen_stroke_method=2):
  save lp_,lq_; lp_=length(pb_-pa_); lq_=length(qb_-qa_);
  if 2lp_<lq_: % heuresis -- too close nodes
   qa_ {sa_} ... {sb_} qb_
  else:
   force_convex_edge(qa_, qa_+lq_/lp_*ra_, qb_+lq_/lp_*rb_, qb_)
  fi
 else:
  errhelp "Only the values 0,1 and 2 for `pen_stroke_method' are admissible. " &
   "Better stop now.";
  errmessage "PX: unknown pen stroke method (" &
   decimal(pen_stroke_method) & ")";
 fi
enddef;
%
vardef pen_stroke_edge@#(expr p) =
 save e_,l_,i_,i__; path e_[\\];
 l_:=length(p);
 for i_:=0 upto l_-1:
  e_[i_]=pen_stroke_edge_(subpath (i_,i_+1) of p,
   % |local_nib_@#(i_),local_nib_@#(i_+1)); %| a nasty bug removed 20.08.2009
   local_nib_@#(i_),local_nib_@#((i_+1) if cycle p: mod l_ fi));
 endfor
 for i_:=0 upto l_ if cycle p: -1 else: -2 fi:
  i__:=(i_+1) mod l_;
  save t_;
  t_:=turn_ang(predir 1 of e_[i_], postdir 0 of e_[i__]);
  if if known t_: abs(t_)>1 else: false fi:
   save t_; (t_.a,t_.b)=e_[i_] intersectiontimes e_[i__];
   if t_.a>0:
    e_[i_]:=subpath (0,t_.a) of e_[i_];
    e_[i__]:=subpath (t_.b,1) of e_[i__];
   elseif known local_tip_@#(i__):
    save tx_, ty_, b_, b__, ei_, ei__; path ei_, ei__, ei_[], ei__[];
    (tx_,ty_)=local_tip_@#(i__);
    ei_:=if is_line(e_[i_]):
     (point 0 of e_[i_])--
     (1/abs(tx_))[point 0 of e_[i_], point 1 of e_[i_] ]
     elseif tx_<0: hide(b_:=1) extrapoline (0,abs(tx_)) of e_[i_]
     else: extrapolate (0,abs(tx_)) of e_[i_] fi;
    ei__:=if is_line(e_[i__]):
     (1/(1-abs(ty_)))[point 1 of e_[i__], point 0 of e_[i__] ] --
     point 1 of e_[i__]
    elseif ty_<0: hide(b__:=1) extrapoline (abs(ty_),1) of e_[i__]
    else: extrapolate (abs(ty_),1) of e_[i__] fi;
% clumsy HEURESIS (choosing an optimal intersection point, if there are
% more intersections):
    save t_; (t_.a1,length(ei__)-t_.b1)=ei_ intersectiontimes reverse ei__;
    if t_.a1>0:
     ei_1:=if (known b_)  and (t_.a1>1):
       force_convex_edge(point 0 of e_[i_], postcontrol 0 of e_[i_],
        precontrol 1 of e_[i_],  point t_.a1 of ei_)
      else: subpath (0,t_.a1) of ei_ fi;
     ei__1:=if (known b__) and (t_.b1<1):
      force_convex_edge(point t_.b1 of ei__, postcontrol 0 of e_[i__],
       precontrol 1 of e_[i__], point 1 of e_[i__])
      else: subpath (t_.b1,infinity) of ei__ fi;
     (length(ei_)-t_.a2,t_.b2)=reverse ei_ intersectiontimes ei__;
     if length((t_.a1,t_.b1)-(t_.a2,t_.b2))>eps:
      ei_2:=if (known b_) and (t_.a2>1):
       force_convex_edge(point 0 of e_[i_], postcontrol 0 of e_[i_],
        precontrol 1 of e_[i_],  point t_.a2 of ei_)
       else: subpath (0,t_.a2) of ei_ fi;
      ei__2:=if (known b__) and (t_.b2<1):
      force_convex_edge(point t_.b2 of ei__, postcontrol 0 of e_[i__],
       precontrol 1 of e_[i__], point 1 of e_[i__])
       else: subpath (t_.b2,infinity) of ei__ fi;
      if arclength(ei_1)+arclength(ei__1) > arclength(ei_2)+arclength(ei__2):
       ei_1:=ei_2; ei__1:=ei__2;
      fi
     fi
     e_[i_]:=ei_1; e_[i__]:=ei__1;
    fi
   fi
  fi
 endfor
 for i_:=0 upto l_-1:
  hide(i__:=(i_-1) mod l_)
  if cycle p or (i_>0):
   if length((point 1 of e_[i__])-(point 0 of e_[i_]))>1/4ignore_nib_limit:
   % the constant |1/4ignore_nib_limit| plays a similar role
   % to that of the |SNAP_TO_NODE| variable in pf2mt1.awk
    (point 1 of e_[i__])
    if known local_tip_@#(i_): -- else:
     && pen_join(predir 1 of e_[i__],postdir 0 of e_[i_],point i_ of p,
      local_nib_@#(i_)) &&
    fi
   fi
  fi
  % reconstruct |e_[i_]| (possibly ignoring direction(s)):
  (point 0 of e_[i_])
   if is_line(e_[i_]):
   % the using of |--| circumvents \MF{}//\MP{} instable behaviour:
   % the operator |...| may cause that a control point and a node
   % (nearly) coincide (note that this is feature, not a bug);
   % thus, it is advisable for |pen_stroke_method=0|; supposedly,
   % it is also adequate for |pen_stroke_method=1|:
    --
   else:
    if pen_stroke_method=0:
     if not ignore_dir_@#(i_): {postdir 0 of e_[i_]} fi ... % |@#| added 19.04.2013
     if not ignore_dir_@#(i_+1): {predir 1 of e_[i_]} fi    % ditto
    elseif (pen_stroke_method=1) or (pen_stroke_method=2):
     .. controls (postcontrol 0 of e_[i_]) and (precontrol 1 of e_[i_]) ..
    fi
   fi
 endfor
 if cycle p: cycle else: (point 1 of e_[l_-1]) fi
enddef;
newinternal pen_stroke_method;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% Macro |pen_stroke| performs an operation known as ``expanding stroke'';
% we'll call the result of the operation a ``pen envelope'' (for
% a given path). The macro has one optional parameter, |opts| (|text|),
% and two obligatory ones: input path~|p| (|expr|)
% and a |result| (|suffix|). A user has an access to subpaths of the
% envelope, namely: |result.r| is the right edge of the envelope,
% |result.l|---its left edge, |result.b|---is a fragment of the pen outline
% joining left and right edge of the envelope at the beginning
% node of the path, |result.e|---is a similar fragment at the ending
% node of the path (see the picture below). If the path~|p|
% is cyclic, then |result.e| and |result.b| are undefined,
% otherwise the variable |result| contains additionally the complete
% expanded stroke.
%% \-
%% \descriptioncomments
% Makro |pen_stroke| realizuje operacj/e znan/a jako ,,ekspansja /scie/zki''
% ({\it expanding stroke\/}); wynik tej operacji b/edziemy okre/sla/c mianem
% ,,obrysu pi/orka'' (dla danej /scie/zki).
% Makro |pen_stroke| ma jeden parametr opcjonalny |opts| (typu |text|)
% oraz dwa parametry obowi/azkowe: /scie/zk/e wej/sciow/a~|p| (typu |expr|)
% i~wynik |result| (typu |suffix|). U/zytkownik ma dost/ep do pod/scie/zek
% obrysu, mianowicie: |result.r| to prawa kraw/ed/x obrysu, |result.l| --
% lewa, |result.b| -- fragment obwiedni pi/orka /l/acz/acy lew/a i~praw/a
% kraw/ed/x w~pocz/atkowym punkcie /scie/zki, |result.e| -- analogiczny
% fragment na ko/ncu /scie/zki (p.~rysunek poni/zej). Je/sli /scie/zka~|p|
% jest zamkni/eta, to |result.e| oraz |result.b| s/a niezdefiniowane,
% je/sli otwarta -- zmienna |result| zawiera dodatkowo kompletny
% obrys /scie/zki.
%% \LINE{\epsfbox{\illusname.109}}
%% \descriptioncomments
% For finding an envelope, a default path (|default_nib|, returned
% by |fix_nib|) is used except nodes for which the parameter |opts|
% sets another pen. Mastering the usage of the parameter |opts| allows
% a user to achieve nontrivial effects. The parameter |opts| is a list
% (space-separated or semicolon-separated) of the following
% operators: (1)~|nib|, (2)~|cut|, (3)~|tip|, and (4)~|ignore_directions|.
%% \-
%% \descriptioncomments
% Do wyznaczenia obrysu wykorzystywane jest pi/orko |default_nib|
% (zdefiniowane za pomoc/a makra |fix_nib|), za wyj/atkiem
% w/ez/l/ow, dla kt/orych parametr |opts| definiuje inne
% pi/orko. Bieg/le wykorzystanie parametru |opts|
% pozwala na uzyskiwanie nietrywialnych efekt/ow. Parametr |opts| jest
% list/a nast/epuj/acych polece/n (separowan/a spacjami lub /srednikami,
% jak kto woli):
% (1)~|nib|, (2)~|cut|, (3)~|tip| oraz (4)~|ignore_directions|.
%% \LINE{}
%% \descriptioncomments
% Ad 1. The macro |nib| has two parameters:
% |nib|(pen)(list_of_nodes), where ``pen'' is a path returned by
% macro |fix_nib|, and ``list_of_nodes'' contains comma-separated numbers
% (times) of the nodes of the path~|p| at which a given pen is to be
% used. If needed, the outline is complemented at corner nodes
% with a fragment of a pen path. Such a join corresponds to the setting
% |linejoin:=rounded| in \MP{}. If the path~|p| is non-cyclic,
% its ends are also complemented with appropriate fragments of a pen path
% (the setting |linecap:=rounded|). Such a method of joining is also applied
% by |pen_stroke| to nodes not mentioned in the parameter |opts|.
% The result of the following statement
%% \-
%% \descriptioncomments
% Ad 1. Wywo/lanie makra |nib| ma posta/c
% |nib|(pi/orko)(lista_w/ez/l/ow), gdzie ,,pi/orko'' jest /scie/zk/a
% zdefiniowan/a za pomoc/a makra |fix_nib|, a~,,lista_w/ez/l/ow'' zawiera
% rozdzielone przecinkami numery (czasy) w/ez/l/ow /scie/zki~|p|, w~kt/orych
% dane pi/orko ma by/c u/zyte. W~punktach naro/znych obrys jest
% w~razie potrzeby uzupe/lniany fragmentem /scie/zki pi/orka. Odpowiada
% to \MP{}-owemu ustawieniu |linejoin:=rounded|. W przypadku /scie/zki
% otwartej tak/ze jej ko/nce s/a uzupe/lnianie fragmentem pi/orka
% (|linecap:=rounded|). Taki spos/ob /l/aczenia stosowany jest r/ownie/z
% przez makro |pen_stroke| w~w/ez/lach niewymienionych w~parametrze
% |opts|. Wynik u/zycia polecenia
%% \LINE{\descriptioncomments
% |pen_stroke(nib(default_nib xyscaled (1,2))(infinity))(p)(q)|
%% \unskip}
%% \descriptioncomments
% that changes the pen at the last node of the path,
% is shown in the following picture:
%% \-
%% \descriptioncomments
% powoduj/acego zmian/e pi/orka w ostatnim w/e/xle /scie/zki
% przedstawia poni/zszy rysunek:
%% \LINE{\epsfbox{\illusname.110}}
%% \descriptioncomments
% Ad 2. The call of the macro |cut| has the form: |cut|(angle,
% pen)(list_of_nodes) or |cut|(pen,~angle)(list_of_nodes),
% where ``pen'' and ``list_of_nodes'' are defined as
% previously. The pen parameter can be omitted which means using a default
% pen (|default_nib|). The macro replaces a default pen with a special
% ``razor'' pen at specified nodes. More precisely, it is a projection of a
% given pen in the direction of the path~|p| at a given node onto a
% straight line going through this node under the angle specified in the
% respective parameter of the macro. Uf\/f\/f\dots\ The angle of the straight
% line can be defined either absolutly (with respect to the axis~|x|)
% or---by adding a prefix `|rel|'---relatively to the direction of the path
% at a given node. From the point of view of a user, the result of the
% macro |cut| is ``cutting'' the expanded stroke with a straight
% line. This operation is particularly useful at the ends of a path and
% corresponds to the setting |linecap:=butt| in \MP{}, except that in \MP{}
% one cannot specify angles. The result of the statement
%% \-
%% \descriptioncomments
% Ad 2. Wywo/lanie makra |cut| ma posta/c |cut|(k/at,
% pi/orko)(lista_w/ez/l/ow) lub |cut|(pi/orko,~k/at)(lista_w/ez/l/ow),
% gdzie ,,pi/orko'' i~,,lista_w/ez/l/ow'' s/a
% zdefiniowane jak wy/zej. Parametr okre/slaj/acy pi/orko mo/zna pomin/a/c,
% co oznacza u/zycie pi/orka domy/slnego (|default_nib|). Makro powoduje
% u/zycie w~zadanych punktach specjalnego pi/orka ,,/zyletkowego'',
% b/ed/acego rzutem danego pi/orka w~kierunku zgodnym z~kierunkiem
% scie/zki |p| w~danym w/e/xle na prost/a, przechodz/ac/a przez ten w/eze/l
% pod k/atem okre/slonym przez parametr ,,k/at''. Uf\/f\/f\dots\ K/at prostej
% mo/ze by/c okre/slany wzgl/edem osi |x|, lub~-- po dodaniu przedrostka
% ,|rel|'~-- wzgl/edem kierunku /scie/zki w~danym w/e/xle. Z~punktu widzenia
% u/zytkownika efektem dzia/lania makra |cut| jest ,,przeci/ecie'' obwiedni
% w~danym w/e/xle zadan/a prost/a~-- jest to u/zyteczne g/l/ownie na
% ko/ncach /scie/zki. Makro to odpowiada \MP{}-owemu ustawieniu
% |linecap:=butt|, z~tym /ze \MP{} nie pozwala na dowolne zadanie
% k/ata /sci/ecia. Wynik u/zycia polecenia
%% \LINE{\descriptioncomments
% |pen_stroke(cut(45)(0)|
% |cut(default_nib xyscaled (1,2), rel 90)(infinity))(p)(q)|
%% \unskip}
%% \descriptioncomments
% that cuts both ends and, moreover, changes a pen
% at the ending node is shown in the figure below
% (at the beginning node, the absolute angle of 45 degrees is specified,
% at the ending one---the relative angle of 90~degrees):
%% \-
%% \descriptioncomments
% definiuj/acego /sci/ecia na ko/ncach /scie/zki wraz ze zmian/a
% pi/orka w~punkcie ko/ncowym przedstawia poni/zszy rysunek
% (w~punkcie pocz/atkowym zadany jest k/at bezwzgl/edny 45~stopni,
% w~ko/ncowym~-- 90~stopni wzgl/edem kierunku /scie/zki):
%% \LINE{\epsfbox{\illusname.111}}
%% \descriptioncomments
% Ad 3. The call of the macro |tip| has the form |tip|(pen,
% pre_elongate, post_elongate)(list_of_nodes), where ``pen''
% and ``list_of_nodes'' have the same meaning as previously.
% In particular, a pen can be omitted. At corner nodes
% specified in the list of nodes, the consecutive elements of the outline
% are not joined with an appropriate subpath of a pen; instead, they
% are elongated (extrapolated) until they intersect. This process corresponds
% (roughly) to the \MP{} setting |linejoin:=mitered|:
%% \-
%% \descriptioncomments
% Ad 3. Wywo/lanie makra |tip| ma posta/c |tip|(pi/orko,
% przed_wyd/lu/zenie, po_wyd/lu/zenie)(lista_w/ez/l/ow), gdzie ,,pi/orko''
% i~,,lista_w/ez/l/ow'' maj/a posta/c jak w~poprzednich makrach,
% w~szczeg/olno/sci pi/orko r/ownie/z mo/zna pomin/a/c. W~w/ez/lach
% naro/znych, wyspecyfikowanych za pomoc/a tego makra, s/asiednie segmenty
% nie s/a /laczone fragmentem /scie/zki pi/orka, tylko s/a przed/lu/zane
% (ekstrapolowane) i~jest znajdowany ich punkt przeci/ecia. Procedura ta
% odpowiada z~grubsza \MP{}-owemu ustawieniu |linejoin:=mitered|:
%% \LINE{\epsfbox{\illusname.112}}
%% \descriptioncomments
% The illustration above is the result of the following call
% of the macro |pen_stroke| (the macro |tip| is invoked with default
% settings, only the number of a node is specified):
%% \-
%% \descriptioncomments
% Powy/zsza ilustracja to rezultat wywo/lania makra |pen_stroke|
% w~nast/epuj/acy (u/zycie makra |tip| bazuje na ustawieniach domy/slnych,
% wyspecyfikowany jest jedynie numer w/ez/la) spos/ob:
%% \LINE{\descriptioncomments
% |pen_stroke(tip()(3))(p)(q); draw q;|
%% \unskip}
%% \descriptioncomments
% The optional parameters |pre_elongation| and |post_elongation| define how
% far the consecutive edges (segments) should be elongated in order to make
% them intersect each other (the measure is the time). If one parameter is
% omitted, both will receive the same value; if both are omitted, a~default
% value, |(0.5,0.5)| (it corresponds to elongation by circa 50\%), will be
% used. The precise meaning of the pre- and post-elongation is defined as
% follows: for a~given pre-edge |e1|, post-edge |e2|, pre-elongation |v1|
% and post-elongation |v2|, the paths
%  |extrapolate (0, 1/(1+v1) of e1| and
%  |extrapolate (v2/(1+v2), 1) of e2| are computed
% (i.e., for the default elongation: |extrapolate (0, 2/3) of s1|
% and |extrapolate (1/3, 1) of s2|, respectively).
% If elongated curves do not intersect, the terminal nodes
% of the consecutive segments are joined with a~straight line. The latter
% property can be used to obtain a~result corresponding to the \MP{} setting
% |linejoin:=beveled|: it suffices to apply a~null elongation, i.e.,
% |tip|(0)(list_of_nodes). Changing the first (empty) parameter
% of the |tip| macro in the previous example would yield the following
% result:
%% \-
%% \descriptioncomments
% Parametry opcjonalne ,,przed_wyd/lu/zenie''
% i~,,po_wyd/lu/zenie'' okre/slaj/a, jak daleko maj/a by/c
% przed/lu/zane kraw/edzie (segmenty)~-- miar/a jest tu czas~--
% aby mo/zna by/lo wyznaczy/c ich punkt przeci/ecia. W~przypadku
% pomini/ecia jednego z~tych~parametr/ow oba otrzymuj/a t/e sam/a
% warto/s/c; je/sli oba zostan/a pomini/ete, u/zyta b/edzie warto/s/c
% domy/slna, tj.~|(0.5,0.5)|, odpowiadaj/aca wyd/lu/zeniu mniej
% wi/ecej o~50\%. /Sci/sle bior/ac: dla danej ,,przed-kraw/edzi''
% |e1|, ,,po-kraw/edzi'' |e2|, ,,przed-wyd/lu/zenia''~|v1| oraz
% ,,po-wyd/lu/zenia''~|v2| wyznaczane s/a /scie/zki
%   |extrapolate (0, 1/(1+v1) of e1| oraz
%   |extrapolate (v2/(1+v2), 1) of e2|
% (tzn.~dla~wyd/lu/zenia domy/slnego odpowiednio
% |extrapolate (0, 2/3) of s1| oraz |extrapolate (1/3, 1) of s2|).
% Je/sli przed/lu/zenia nie~przetn/a si/e, w/ez/ly obrysu
% /l/aczone s/a odcinkiem prostym. Ostatnia w/lasno/s/c umo/zliwia
% osi/agni/ecie efektu analogicznego do skutk/ow ustawienia
% |linejoin:=beveled|. W~tym celu nale/zy u/zy/c zerowego wyd/lu/zenia:
% |tip|(0)(lista_w/ez/l/ow). U/zycie w~poprzednim przyk/ladzie zera zamiast
% pierwszego (pustego) parametru makra |tip| da/loby nast/epuj/acy~efekt:
%% \LINE{\epsfbox{\illusname.113}}
%% \descriptioncomments
% Ad 4. The macro |ignore_directions| has a different character. It is
% invoked with one parameter being a comma-separated list of nodes:
% |ignore_directions|(list_of_nodes). The numbers {\it must be\/} followed
% by sufixes |l| or |r|. The macro causes that, at specified nodes,
% the direction of the outline is not forced to be parallel to the direction
% of the path~|p| (which is the default); instead, the direction is
% calculated by \MP{}. Suffixes determine whether the direction
% is not to be forced at the right (|r|) or the left~(|l|) edge (with
% respect to the direction of the path~|p|). This heuristic
% trick can be used to improve the appearence of the outline
% if the ``inner'' part of the envelope has too tight arcs.
%%%% The examples of the usage of this macro can be found in the \MP{} version
%%%% of D.~E.~Knuth's `logo' font (letters `P'~and~,S').
%% \-
%% \descriptioncomments
% Ad 4. Wywo/lanie makra |ignore_directions| ma posta/c
% |ignore_directions|(lista_w/ez/l/ow), gdzie ,,lista w/ez/l/ow'' zawiera
% rozdzielone przecinkami numery (czasy) w/ez/l/ow /scie/zki~|p|
% z~{\it obowi/azkowymi\/} sufiksami |l| albo |r|. Makro to spe/lnia nieco
% inn/a rol/e ni/z poprzednie~-- powoduje mianowicie, /ze w~zadanych
% w/ez/lach kierunek krzywej tworz/acej obrys nie jest wymuszany (normalnie
% jest on r/ownoleg/ly do kierunku /scie/zki~|p| w~odpowiadaj/acym punkcie).
% Sufiksy okre/slaj/a, czy~niewymuszanie kierunku ma~dotyczy/c prawej~(|r|)
% czy te/z lewej~(|l|) strony obrysu (patrz/ac zgodnie z~kierunkiem
% /scie/zki). Taki heurystyczny zabieg poprawia na og/o/l wygl/ad obrysu,
% gdy jego ,,wewn/etrzna'' cz/e/s/c ma zbyt ciasne /luki.
%%%% Przyk/lad u/zycia
%%%% tego sposobu korygowania kszta/ltu /scie/zki mo/zna znale/x/c w~\MP{}-owej
%%%% wersji fontu ,logo' D.~E.~Knutha (litery ,P'~i~,S').
%% \--------------------------------------------------------------------
vardef pen_stroke(text opts)(expr p)(suffix result) =
 forsuffixes $=,r,l,b,e:
  if not path result$: scantokens("path " & generisize(str result$)); fi
 endfor
 save a_, a__, d_, i_, k_, n_, p_, z_, norm_, norml_, normr_, normlr_,
  fix_opts_, ignore_dir_, ignore_dir__, local_nib_, local_nib__,
  local_tip_, default_tip_, local_tip__, % internal
  all, rel, last, nib, cut, tip, ignore_directions, current_node; % exported
 numeric ignore_dir__[\\]; pair default_tip_, local_tip__[\\];
 path local_nib__[\\];
 pair a_, d_, z_[\\]; path p_;
%%% xpart norm_ norml_ normr_ normlr_
 vardef norm_ primary n =
  if cycle p: n mod last else: if n<0: 0 elseif n>last: last else: n fi fi
 enddef;
 vardef norml_ primary n = -norm_ n -1 enddef;
 vardef normr_ primary n = norm_ n +1 enddef;
 vardef normlr_@# primary i= if str @#="l": -norm_(last-i)-1 else: i+1 fi enddef;
 last=length(p);
 vardef rel primary a =
  angle((gendir current_node of p) slant_stroke)+a
 enddef;
 def all =
  hide(% locally we use the prefix rather than postfix noitation;
       % a trick due to the |suffix| parameter of the |allcont_| macro
   vardef l primary n = (norml_ n,0) enddef;
   vardef r primary n = (normr_ n,0) enddef) allcont_
 enddef;
 def allcont_ suffix $ =
  $0 for i_:=1 upto last if cycle p: -1 fi: , $i_ endfor
 enddef;
 vardef fixopts_(suffix optname)(text nodes) text val =
%%% intersectiontimes lcont_ rcont_
  save l, r, lcont_, rcont_;
  def l = lcont_ whatever enddef; primarydef a lcont_ b = (norml_ a,0) enddef;
  def r = rcont_ whatever enddef; primarydef a rcont_ b = (normr_ a,0) enddef;
  for n_:=nodes:
   if numeric n_:
    current_node:=norm_ n_;
    optname[norml_ n_]:=optname[normr_ n_]
   else:
    current_node:=abs(xpart n_)-1; % the inverse of both |norml_| and |normr_|
    optname[xpart(n_)]
   fi :=val; % |val| may depend on |current_node|
  endfor
 enddef;
 def nib(text nib_)(text nodes) = % nib and node list
  fixopts_(local_nib__)(nodes)
   begingroup
    p_:=default_nib; for k_:=nib_: p_:=k_; endfor \\ p_
   endgroup;
 enddef;
 def cut(text nib_and_ang)(text nodes) = % angle, nib and node list
  fixopts_(local_nib__)(nodes)
   begingroup
    p_:=default_nib;
    for k_:=nib_and_ang:
     if numeric k_: a_:=dir(unslant_angle(k_)); else: p_:=k_; fi
    endfor
    d_:=gendir current_node of p;
    z_1:=whatever*a_=tangent_point(d_,p_)+whatever*d_;
    z_2:=whatever*a_=tangent_point(-d_,p_)+whatever*d_;
    z_1--z_2
   endgroup;
 enddef;
 def tip(text nib_and_lim)(text nodes)= % limit(s) and node list
  i_:=0; for n_:=nib_and_lim: if numeric n_: i_[incr i_]:=n_; fi endfor
  fixopts_(local_tip__)(nodes)
   elongation_to_times(if i_=0: default_elongation, default_elongation
    elseif i_=1: i_1, i_1 else: i_1, i_2 fi);
  fixopts_(local_nib__)(nodes)
   begingroup
    p_:=default_nib; for k_:=nib_and_lim: if path k_: p_:=k_; fi endfor \\ p_
   endgroup;
 enddef;
 def ignore_directions(text nodes) = % node list
  fixopts_(ignore_dir__)(nodes) 1;
 enddef;
 if default_cap=0:
  if not cycle p: cut(rel 90)(0,last); fi
 elseif default_cap=1: % do nothing
 else:
  errhelp "Admissible values are 0, 1; continue, I'll use the value 1.";
  errmessage "PX: improper `default_cap' value ("&decimal(default_cap)&")";
 fi
 opts;
%
 if default_join=0:
  default_tip_:=elongation_to_times(default_elongation, default_elongation);
 elseif default_join=1: % no tip setting, do nothing
 elseif default_join=2:
  default_tip_:=(1,0); % |(1,0)=elongation_to_times(0,0)|
 else:
  errhelp "Admissible values are 0, 1, 2; continue, I'll use the value 1.";
  errmessage "PX: improper `default_join' value ("&decimal(default_join)&")";
 fi
 vardef ignore_dir_@#(expr i) = known ignore_dir__[normlr_@# i] enddef;
 vardef local_tip_@#(expr i) = if known local_tip__[normlr_@# i]:
  local_tip__[normlr_@# i] else: default_tip_ fi enddef;
 vardef local_nib_@#(expr i) = if known local_nib__[normlr_@# i]:
  local_nib__[normlr_@# i] else: default_nib fi enddef;
 result.r:=pen_stroke_edge.r(p);
 result.l:=pen_stroke_edge.l(reverse p);
 if not cycle p:
  result.b:=pen_cap(predir infinity of result.l,postdir 0 of result.r,
   -postdir 0 of p,point 0 of p,local_nib_.l(last),local_nib_.r(0));
  result.e:=pen_cap(predir infinity of result.r,postdir 0 of result.l,
   predir last of p,point last of p,local_nib_.r(last), local_nib_.l(0));
  result:=result.r && result.e && result.l && result.b && cycle;
 fi
enddef;

vardef pen_cap(expr a,b,c,p,niba,nibb)=
 if path_eq(niba,nibb): pen_join(a,b,p,niba)
 else: pen_join(a,c rotated 90,p,niba)--pen_join(c rotated 90,b,p,nibb)
 fi
enddef;
%% \--------------------------------------------------------------------
%% \descriptioncomments
% Sometimes the results yielded by |find_outlines| can be further
% improved, although it is not advisable to relay on fully
% automatic approach. Macro |correct_close_triplets|
% replaces three close nodes by a single (central) one:
%% \-
%% \descriptioncomments
% W~niekt/orych przypadkach wyniki generowane przez makro
% |find_outlines| mo/zna nieco poprawi/c, aczkolwiek nie
% nale/za/loby polega/c na~w~pe/lni automatycznym przetwarzaniu.
% Makro |correct_close_triplets| zast/epuje trzy bliskie
% w/ez/ly pojedynczym (centralnym):
%% %
%% \LINE{\epsfbox{\illusname.107}}
%% %
%% \descriptioncomments
% while macro |correct_close_doublets| replaces two close nodes
% by a single one (of two nodes of the short segment remains
% the node at which the change of direction is less abrupt):
%% \-
%% \descriptioncomments
% natomiast |correct_close_doublets| zast/epuje dwa bliskie w/ez/ly
% jednym (pozostawiany jest ten koniec kr/otkiego segmentu, w~kt/orym
% /scie/zka zmienia kierunek mniej gwa/ltownie):
%% %
%% \LINE{\epsfbox{\illusname.108}}
%% %
%% Red colour denotes the points that are being removed;
%% filled circles denote nodes, outlined ones---control points.
%% \-
%% Kolor czerwony oznacza punkty usuwane; wype/lnione k/o/lka
%% oznaczaj/a w/ez/ly, natomiast obrysowane k/o/lka -- naci/agi.
%% \--------------------------------------------------------------------
vardef correct_close_triplets(expr p, acc) =
 save i_; i_:=1;
 forever:
  if arclength(subpath(i_-1,i_+1) of p)<=acc:
   (point i_ of p) ..
    controls (postcontrol incr(i_) of p) and (precontrol incr(i_) of p) ..
  else:
   (point i_-1 of p) ..
    controls (postcontrol i_-1 of p) and (precontrol  i_ of p) ..
  fi
  exitif incr(i_)=length(p)+1;
 endfor
 (point length(p) of p) & cycle
enddef;
%
vardef correct_close_doublets(expr p, acc) =
 save p_,was_item_; path p_; p_:=p;
 p_:=delete_nodes(p_)(
  for i_:=0 upto length(p)-1:
   if arclength(subpath(i_,i_+1) of p)<=acc:
    if known was_item_: , fi (i_,1) hide(was_item_:=1)
   fi
  endfor);
 p_
enddef;
%
endinput
%%\end

