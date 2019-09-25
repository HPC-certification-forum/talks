%%
%% This is file `jocseart.cls',
%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jocseart}
\def\@classname{jocseart}
\InputIfFileExists{jocseart-preload-hook.tex}{%
  \ClassWarning{\@classname}{%
    I am loading jocseart-preload-hook.tex. You are fully responsible
    for any problems from now on.}}{}
\RequirePackage{xkeyval}
\RequirePackage{xstring}
\define@choicekey*+{jocseart.cls}{format}[\JOCSE@format\JOCSE@format@nr]{%
  manuscript, jocsesmall, jocselarge, jocsetog, jocse}[manuscript]{}{%
  \ClassError{\@classname}{The option format must be manuscript,
    jocsesmall, jocselarge, jocsetog, jocse}}
\def\@DeclareJOCSEFormat#1{\DeclareOptionX{#1}{\setkeys{jocseart.cls}{format=#1}}}
\@DeclareJOCSEFormat{manuscript}
\@DeclareJOCSEFormat{jocsesmall}
\@DeclareJOCSEFormat{jocselarge}
\@DeclareJOCSEFormat{jocsetog}
\@DeclareJOCSEFormat{jocse}
\ExecuteOptionsX{format}
\define@boolkey+{jocseart.cls}[@JOCSE@]{screen}[true]{%
  \if@JOCSE@screen
    \PackageInfo{\@classname}{Using screen mode}%
  \else
    \PackageInfo{\@classname}{Not using screen mode}%
  \fi}{\PackageError{\@classname}{The option screen can be either true or
    false}}
\ExecuteOptionsX{screen=false}
\define@boolkey+{jocseart.cls}[@JOCSE@]{jocsethm}[true]{%
  \if@JOCSE@jocsethm
    \PackageInfo{\@classname}{Requiring jocsethm}%
  \else
    \PackageInfo{\@classname}{Suppressing jocsethm}%
  \fi}{\PackageError{\@classname}{The option jocsethm can be either true or
    false}}
\ExecuteOptionsX{jocsethm=true}
\define@boolkey+{jocseart.cls}[@JOCSE@]{review}[true]{%
  \if@JOCSE@review
    \PackageInfo{\@classname}{Using review mode}%
    \AtBeginDocument{\@JOCSE@printfoliostrue}%
  \else
    \PackageInfo{\@classname}{Not using review mode}%
  \fi}{\PackageError{\@classname}{The option review can be either true or
    false}}
\ExecuteOptionsX{review=false}
\define@boolkey+{jocseart.cls}[@JOCSE@]{authorversion}[true]{%
  \if@JOCSE@authorversion
    \PackageInfo{\@classname}{Using authorversion mode}%
  \else
    \PackageInfo{\@classname}{Not using authorversion mode}%
  \fi}{\PackageError{\@classname}{The option authorversion can be either true or
    false}}
\ExecuteOptionsX{authorversion=false}
\define@boolkey+{jocseart.cls}[@JOCSE@]{natbib}[true]{%
  \if@JOCSE@natbib
    \PackageInfo{\@classname}{Explicitly selecting natbib mode}%
  \else
    \PackageInfo{\@classname}{Explicitly deselecting natbib mode}%
  \fi}{\PackageError{\@classname}{The option natbib can be either true or
    false}}
\ExecuteOptionsX{natbib=true}
\define@boolkey+{jocseart.cls}[@JOCSE@]{anonymous}[true]{%
  \if@JOCSE@anonymous
    \PackageInfo{\@classname}{Using anonymous mode}%
  \else
    \PackageInfo{\@classname}{Not using anonymous mode}%
  \fi}{\PackageError{\@classname}{The option anonymous can be either true or
    false}}
\ExecuteOptionsX{anonymous=false}
\define@boolkey+{jocseart.cls}[@JOCSE@]{timestamp}[true]{%
  \if@JOCSE@timestamp
    \PackageInfo{\@classname}{Using timestamp mode}%
  \else
    \PackageInfo{\@classname}{Not using timestamp mode}%
  \fi}{\PackageError{\@classname}{The option timestamp can be either true or
    false}}
\ExecuteOptionsX{timestamp=false}
\define@boolkey+{jocseart.cls}[@JOCSE@]{authordraft}[true]{%
  \if@JOCSE@authordraft
    \PackageInfo{\@classname}{Using authordraft mode}%
    \@JOCSE@timestamptrue
    \@JOCSE@reviewtrue
  \else
    \PackageInfo{\@classname}{Not using authordraft mode}%
  \fi}{\PackageError{\@classname}{The option authordraft can be either true or
    false}}
\ExecuteOptionsX{authordraft=false}
\def\JOCSE@fontsize{}
\DeclareOptionX{9pt}{\edef\JOCSE@fontsize{\CurrentOption}}
\DeclareOptionX{10pt}{\edef\JOCSE@fontsize{\CurrentOption}}
\DeclareOptionX{11pt}{\edef\JOCSE@fontsize{\CurrentOption}}
\DeclareOptionX{12pt}{\edef\JOCSE@fontsize{\CurrentOption}}
\DeclareOptionX{draft}{\PassOptionsToClass{\CurrentOption}{amsart}}
\DeclareOptionX{*}{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptionsX
\ClassInfo{\@classname}{Using format \JOCSE@format, number \JOCSE@format@nr}
\newif\if@JOCSE@manuscript
\newif\if@JOCSE@journal
\newif\if@JOCSE@sigchiamode
\ifnum\JOCSE@format@nr=5\relax % siggraph
  \ClassWarning{\@classname}{The format siggraph is now obsolete.
    I am switching to jocse.}
  \setkeys{jocseart.cls}{format=jocse}
\fi
\ifnum\JOCSE@format@nr=0\relax
  \@JOCSE@manuscripttrue
\else
  \@JOCSE@manuscriptfalse
\fi
\@JOCSE@sigchiamodefalse
\ifcase\JOCSE@format@nr
\relax % manuscript
  \@JOCSE@journaltrue
\or % jocsesmall
  \@JOCSE@journaltrue
\or % jocselarge
  \@JOCSE@journaltrue
\or % jocsetog
  \@JOCSE@journaltrue
\or % jocse
  \@JOCSE@journalfalse
\fi
\ifx\JOCSE@fontsize\@empty
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \def\JOCSE@fontsize{9pt}%
  \or % jocsesmall
    \def\JOCSE@fontsize{10pt}%
  \or % jocselarge
    \def\JOCSE@fontsize{10pt}%
  \or % jocsetog
    \def\JOCSE@fontsize{9pt}%
  \or % jocse
    \def\JOCSE@fontsize{9pt}%
  \fi
\fi
\ClassInfo{\@classname}{Using fontsize \JOCSE@fontsize}
\LoadClass[\JOCSE@fontsize, reqno]{amsart}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{refcount}
\RequirePackage{totpages}
\RequirePackage{environ}
\if@JOCSE@manuscript
\RequirePackage{setspace}
\onehalfspacing
\fi
\RequirePackage{textcase}
\if@JOCSE@natbib
  \RequirePackage{natbib}
  \renewcommand{\bibsection}{%
     \section*{\refname}%
     \phantomsection\addcontentsline{toc}{section}{\refname}%
  }
  \renewcommand{\bibfont}{\bibliofont}
  \renewcommand\setcitestyle[1]{
  \@for\@tempa:=#1\do
  {\def\@tempb{round}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{(}\renewcommand\NAT@close{)}\fi
   \def\@tempb{square}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{[}\renewcommand\NAT@close{]}\fi
   \def\@tempb{angle}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{$<$}\renewcommand\NAT@close{$>$}\fi
   \def\@tempb{curly}\ifx\@tempa\@tempb
     \renewcommand\NAT@open{\{}\renewcommand\NAT@close{\}}\fi
   \def\@tempb{semicolon}\ifx\@tempa\@tempb
     \renewcommand\NAT@sep{;}\fi
   \def\@tempb{colon}\ifx\@tempa\@tempb
     \renewcommand\NAT@sep{;}\fi
   \def\@tempb{comma}\ifx\@tempa\@tempb
     \renewcommand\NAT@sep{,}\fi
   \def\@tempb{authoryear}\ifx\@tempa\@tempb
     \NAT@numbersfalse\fi
   \def\@tempb{numbers}\ifx\@tempa\@tempb
     \NAT@numberstrue\NAT@superfalse\fi
   \def\@tempb{super}\ifx\@tempa\@tempb
     \NAT@numberstrue\NAT@supertrue\fi
   \def\@tempb{nobibstyle}\ifx\@tempa\@tempb
     \let\bibstyle=\@gobble\fi
   \def\@tempb{bibstyle}\ifx\@tempa\@tempb
     \let\bibstyle=\@citestyle\fi
   \def\@tempb{sort}\ifx\@tempa\@tempb
     \def\NAT@sort{\@ne}\fi
   \def\@tempb{nosort}\ifx\@tempa\@tempb
     \def\NAT@sort{\z@}\fi
   \def\@tempb{compress}\ifx\@tempa\@tempb
     \def\NAT@cmprs{\@ne}\fi
   \def\@tempb{nocompress}\ifx\@tempa\@tempb
     \def\NAT@cmprs{\@z}\fi
   \def\@tempb{sort&compress}\ifx\@tempa\@tempb
     \def\NAT@sort{\@ne}\def\NAT@cmprs{\@ne}\fi
   \def\@tempb{mcite}\ifx\@tempa\@tempb
     \let\NAT@merge\@ne\fi
   \def\@tempb{merge}\ifx\@tempa\@tempb
     \@ifnum{\NAT@merge<\tw@}{\let\NAT@merge\tw@}{}\fi
   \def\@tempb{elide}\ifx\@tempa\@tempb
     \@ifnum{\NAT@merge<\thr@@}{\let\NAT@merge\thr@@}{}\fi
   \def\@tempb{longnamesfirst}\ifx\@tempa\@tempb
     \NAT@longnamestrue\fi
   \def\@tempb{nonamebreak}\ifx\@tempa\@tempb
     \def\NAT@nmfmt#1{\mbox{\NAT@up#1}}\fi
   \expandafter\NAT@find@eq\@tempa=\relax\@nil
   \if\@tempc\relax\else
     \expandafter\NAT@rem@eq\@tempc
     \def\@tempb{open}\ifx\@tempa\@tempb
      \xdef\NAT@open{\@tempc}\fi
     \def\@tempb{close}\ifx\@tempa\@tempb
      \xdef\NAT@close{\@tempc}\fi
     \def\@tempb{aysep}\ifx\@tempa\@tempb
      \xdef\NAT@aysep{\@tempc}\fi
     \def\@tempb{yysep}\ifx\@tempa\@tempb
      \xdef\NAT@yrsep{\@tempc}\fi
     \def\@tempb{notesep}\ifx\@tempa\@tempb
      \xdef\NAT@cmt{\@tempc}\fi
     \def\@tempb{citesep}\ifx\@tempa\@tempb
      \xdef\NAT@sep{\@tempc}\fi
   \fi
  }%
  \NAT@@setcites
  }
  \renewcommand\citestyle[1]{%
    \ifcsname bibstyle@#1\endcsname%
    \csname bibstyle@#1\endcsname\let\bibstyle\@gobble%
    \else%
    \@latex@error{Undefined `#1' citestyle}%
    \fi
  }%
\fi
\newcommand{\bibstyle@jocseauthoryear}{%
  \setcitestyle{%
    authoryear,%
    open={[},close={]},citesep={;},%
    aysep={},yysep={,},%
    notesep={, }}}
\newcommand{\bibstyle@jocsenumeric}{%
  \setcitestyle{%
    numbers,sort&compress,%
    open={[},close={]},citesep={,},%
    notesep={, }}}
\if@JOCSE@natbib
\citestyle{jocsenumeric}
\fi
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \edef\@toclevel{\ifnum#2=\@m 0\else\number#2\fi}%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \ifnum #2>\c@secnumdepth \else
        \@tochangmeasure{\csname the#1\endcsname}%
    \fi
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \ifnum #2>\c@secnumdepth \else
        \@tochangmeasure{\csname the#1\endcsname\space}%
      \fi
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\def\@seccntformat#1{\csname the#1\endcsname\quad}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}
\def\@starttoc#1#2{\begingroup\makeatletter
  \setTrue{#1}%
  \par\removelastskip\vskip\z@skip
  \@startsection{section}\@M\z@{\linespacing\@plus\linespacing}%
    {.5\linespacing}{\centering\contentsnamefont}{#2}%
  \@input{\jobname.#1}%
  \if@filesw
    \@xp\newwrite\csname tf@#1\endcsname
    \immediate\@xp\openout\csname tf@#1\endcsname \jobname.#1\relax
  \fi
  \global\@nobreakfalse \endgroup
  \addvspace{32\p@\@plus14\p@}%
}
\def\l@section{\@tocline{1}{0pt}{1pc}{2pc}{}}
\def\l@subsection{\@tocline{2}{0pt}{1pc}{3pc}{}}
\def\l@subsubsection{\@tocline{2}{0pt}{1pc}{5pc}{}}
\let\@footnotemark@nolink\@footnotemark
\let\@footnotetext@nolink\@footnotetext
\RequirePackage[bookmarksnumbered,unicode]{hyperref}
\pdfstringdefDisableCommands{%
  \def\unskip{}%
  \def\textbullet{- }%
  \def\textrightarrow{ -> }%
  \def\footnotemark{}%
}
\urlstyle{rm}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
\or % jocselarge
\or % jocsetog
\or % jocse
\fi
\AtEndPreamble{%
  \if@JOCSE@screen
    \hypersetup{colorlinks,
      linkcolor=JOCSERed,
      citecolor=JOCSEPurple,
      urlcolor=JOCSEDarkBlue,
      filecolor=JOCSEDarkBlue}
    \else
    \hypersetup{hidelinks}
  \fi}
\if@JOCSE@natbib
  \let\citeN\cite
  \let\cite\citep
  \let\citeANP\citeauthor
  \let\citeNN\citeyearpar
  \let\citeyearNP\citeyear
  \let\citeNP\citealt
  \DeclareRobustCommand\citeA
     {\begingroup\NAT@swafalse
       \let\NAT@ctype\@ne\NAT@partrue\NAT@fullfalse\NAT@open\NAT@citetp}%
  \providecommand\newblock{}%
\else
  \AtBeginDocument{%
    \let\shortcite\cite%
    \providecommand\citename[1]{#1}}
\fi
\newcommand\shortcite[2][]{%
  \ifNAT@numbers\cite[#1]{#2}\else\citeyearpar[#1]{#2}\fi}
\def\bibliographystyle#1{%
  \ifx\@begindocumenthook\@undefined\else
    \expandafter\AtBeginDocument
  \fi
    {\if@filesw
       \immediate\write\@auxout{\string\bibstyle{#1}}%
     \fi}}
\RequirePackage{graphicx}
\RequirePackage[prologue]{xcolor}
\definecolor[named]{JOCSEBlue}{cmyk}{1,0.1,0,0.1}
\definecolor[named]{JOCSEYellow}{cmyk}{0,0.16,1,0}
\definecolor[named]{JOCSEOrange}{cmyk}{0,0.42,1,0.01}
\definecolor[named]{JOCSERed}{cmyk}{0,0.90,0.86,0}
\definecolor[named]{JOCSELightBlue}{cmyk}{0.49,0.01,0,0}
\definecolor[named]{JOCSEGreen}{cmyk}{0.20,0,1,0.19}
\definecolor[named]{JOCSEPurple}{cmyk}{0.55,1,0,0.15}
\definecolor[named]{JOCSEDarkBlue}{cmyk}{1,0.58,0,0.21}
\if@JOCSE@authordraft
  \RequirePackage{draftwatermark}
  \SetWatermarkFontSize{0.5in}
  \SetWatermarkColor[gray]{.9}
  \SetWatermarkText{\parbox{12em}{\centering
      Unpublished working draft.\\
      Not for distribution.}}
\fi
\RequirePackage{geometry}
\ifcase\JOCSE@format@nr
\relax % manuscript
   \geometry{letterpaper,head=13pt,
   marginparwidth=6pc,heightrounded}%
\or % jocsesmall
   \geometry{twoside=true,
     includeheadfoot, head=13pt, foot=2pc,
     paperwidth=6.75in, paperheight=10in,
     top=58pt, bottom=44pt, inner=46pt, outer=46pt,
     marginparwidth=2pc,heightrounded
   }%
\or % jocselarge
   \geometry{twoside=true, head=13pt, foot=2pc,
     paperwidth=8.5in, paperheight=11in,
     includeheadfoot,
     top=78pt, bottom=114pt, inner=81pt, outer=81pt,
     marginparwidth=4pc,heightrounded
     }%
\or % jocsetog
   \geometry{twoside=true, head=13pt, foot=2pc,
     paperwidth=8.5in, paperheight=11in,
     includeheadfoot, columnsep=24pt,
     top=52pt, bottom=75pt, inner=52pt, outer=52pt,
     marginparwidth=2pc,heightrounded
     }%
\or % jocse
   \geometry{twoside=true, head=13pt,
     paperwidth=8.5in, paperheight=11in,
     includeheadfoot, columnsep=2pc,
     top=57pt, bottom=73pt, inner=54pt, outer=54pt,
     marginparwidth=2pc,heightrounded
     }%
\fi
\setlength\parindent{10\p@}
\setlength\parskip{\z@}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
\or % jocselarge
\or % jocsetog
  \setlength\parindent{9\p@}%
\or % jocse
\fi
\setlength\normalparindent{\parindent}
\def\copyrightpermissionfootnoterule{\kern-3\p@
  \hrule \@width \columnwidth \kern 2.6\p@}
\RequirePackage{manyfoot}
\SelectFootnoteRule[2]{copyrightpermission}
\DeclareNewFootnote{authorsaddresses}
\SelectFootnoteRule[2]{copyrightpermission}
\DeclareNewFootnote{copyrightpermission}
\def\footnoterule{\kern-3\p@
  \hrule \@width 4pc \kern 2.6\p@}
\def\endminipage{%
    \par
    \unskip
    \ifvoid\@mpfootins\else
      \vskip\skip\@mpfootins
      \normalcolor
      \unvbox\@mpfootins
    \fi
    \@minipagefalse
  \color@endgroup
  \egroup
  \expandafter\@iiiparbox\@mpargs{\unvbox\@tempboxa}}
\def\@makefntext{\noindent\@makefnmark}
\if@JOCSE@sigchiamode
\long\def\@footnotetext#1{\marginpar{%
    \reset@font\small
    \interlinepenalty\interfootnotelinepenalty
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}%
\fi
\long\def\@mpfootnotetext#1{%
  \global\setbox\@mpfootins\vbox{%
    \unvbox\@mpfootins
    \reset@font\footnotesize
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel
         {\csname p@mpfootnote\endcsname\@thefnmark}%
    \color@begingroup\centering
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}
\def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}
\def\@textbottom{\vskip \z@ \@plus 1pt}
\let\@texttop\relax
\RequirePackage{iftex}
\ifPDFTeX
\input{glyphtounicode}
\pdfglyphtounicode{f_f}{FB00}
\pdfglyphtounicode{f_f_i}{FB03}
\pdfglyphtounicode{f_f_l}{FB04}
\pdfglyphtounicode{f_i}{FB01}
\pdfglyphtounicode{t_t}{00740074}
\pdfglyphtounicode{f_t}{00660074}
\pdfglyphtounicode{T_h}{00540068}
\pdfgentounicode=1
\fi
\RequirePackage{cmap}
\newif\if@JOCSE@newfonts
\@JOCSE@newfontstrue
\IfFileExists{libertine.sty}{}{\ClassWarning{\@classname}{You do not
    have the libertine package installed.  Please upgrade your
    TeX}\@JOCSE@newfontsfalse}
\IfFileExists{zi4.sty}{}{\ClassWarning{\@classname}{You do not
    have the zi4 package installed.  Please upgrade your
    TeX}\@JOCSE@newfontsfalse}
\IfFileExists{newtxmath.sty}{}{\ClassWarning{\@classname}{You do not
    have the newtxmath package installed.  Please upgrade your
    TeX}\@JOCSE@newfontsfalse}
\if@JOCSE@newfonts
\ifxetex
  \RequirePackage[tt=false]{libertine}
\else
  \RequirePackage[tt=false, type1=true]{libertine}
\fi
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\ifxetex\else
  \RequirePackage[T1]{fontenc}
\fi
\fi
\let\liningnums\@undefined
\AtEndPreamble{%
  \DeclareTextFontCommand{\liningnums}{\libertineLF}}
\if@JOCSE@sigchiamode
  \renewcommand{\familydefault}{\sfdefault}
\fi
\RequirePackage{caption, float}
\captionsetup[table]{position=top}
\if@JOCSE@journal
  \captionsetup{labelfont={sf, small},
    textfont={sf, small}, margin=\z@}
  \captionsetup[figure]{name={Fig.}}
\else
  \captionsetup{labelfont={bf},
    textfont={bf}, labelsep=colon, margin=\z@}
  \ifcase\JOCSE@format@nr
  \relax % manuscript
  \or % jocsesmall
  \or % jocselarge
  \or % jocsetog
  \or % jocse
  \fi
\fi
\newfloat{sidebar}{}{sbar}
\floatname{sidebar}{Sidebar}
\renewenvironment{sidebar}{\Collect@Body\@sidebar}{}
\long\def\@sidebar#1{\bgroup\captionsetup{type=sidebar}%
  \marginpar{\small#1}\egroup}
\newenvironment{marginfigure}{\Collect@Body\@marginfigure}{}
\long\def\@marginfigure#1{\bgroup\captionsetup{type=figure}%
  \marginpar{\centering\small#1}\egroup}
\newenvironment{margintable}{\Collect@Body\@margintable}{}
\long\def\@margintable#1{\bgroup\captionsetup{type=table}%
  \marginpar{\centering\small#1}\egroup}
\newdimen\fulltextwidth
\fulltextwidth=\dimexpr(\textwidth+\marginparwidth+\marginparsep)
\if@JOCSE@sigchiamode
\def\@dblfloat{\bgroup\columnwidth=\fulltextwidth
  \let\@endfloatbox\@endwidefloatbox
  \def\@fpsadddefault{\def\@fps{tp}}%
  \@float}
\fi
\if@JOCSE@sigchiamode
\def\end@dblfloat{%
    \end@float\egroup}
\fi
\def\@endwidefloatbox{%
  \par\vskip\z@skip
  \@minipagefalse
  \outer@nobreak
  \egroup
  \color@endbox
  \global\setbox\@currbox=\vbox{\moveleft
    \dimexpr(\fulltextwidth-\textwidth)\box\@currbox}%
  \wd\@currbox=\textwidth
}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
\or % jocselarge
\or % jocsetog
\or % jocse
\fi
\newdimen\@JOCSE@labelwidth
\AtBeginDocument{%
  \setlength\labelsep{4pt}
  \setlength{\@JOCSE@labelwidth}{6.5pt}

  %% First-level list: when beginning after the first line of an
  %% indented paragraph or ending before an indented paragraph, labels
  %% should not hang to the left of the preceding/following text.
  \setlength\leftmargini{\z@}
  \addtolength\leftmargini{\parindent}
  \addtolength\leftmargini{2\labelsep}
  \addtolength\leftmargini{\@JOCSE@labelwidth}

  %% Second-level and higher lists.
  \setlength\leftmarginii{\z@}
  \addtolength\leftmarginii{0.5\labelsep}
  \addtolength\leftmarginii{\@JOCSE@labelwidth}
  \setlength\leftmarginiii{\leftmarginii}
  \setlength\leftmarginiv{\leftmarginiii}
  \setlength\leftmarginv{\leftmarginiv}
  \setlength\leftmarginvi{\leftmarginv}
  \@listi}
\newskip\listisep
\listisep\smallskipamount
\def\@listI{\leftmargin\leftmargini
  \labelwidth\leftmargini \advance\labelwidth-\labelsep
  \listparindent\z@
  \topsep\listisep}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
\renewcommand{\descriptionlabel}[1]{\upshape\bfseries #1}
\renewenvironment{description}{\list{}{%
    \labelwidth\@JOCSE@labelwidth
    \let\makelabel\descriptionlabel}%
}{
  \endlist
}
\let\enddescription=\endlist % for efficiency
\define@choicekey*+{JOCSE}{jocseJournal}[\@journalCode\@journalCode@nr]{%
  JOCSE}{%
\ifcase\@journalCode@nr
\relax % JOCSE
  \def\@journalName{Journal of Computational Science Education}%
  \def\@journalNameShort{JOCSE}%
  \def\@permissionCodeOne{0000-0000}%
\fi
\ClassInfo{\@classname}{Using journal code \@journalCode}%
}{%
  \ClassError{\@classname}{Incorrect journal #1}%
}%
\def\jocseJournal#1{\setkeys{JOCSE}{jocseJournal=#1}}
\def\@journalCode@nr{0}
\def\@journalName{}%
\def\@journalNameShort{\@journalName}%
\def\@permissionCodeOne{XXXX-XXXX}%
\def\@permissionCodeTwo{}%
\newcommand\jocseConference[4][]{%
  \gdef\jocseConference@shortname{#1}%
  \gdef\jocseConference@name{#2}%
  \gdef\jocseConference@date{#3}%
  \gdef\jocseConference@venue{#4}%
  \ifx\jocseConference@shortname\@empty
    \gdef\jocseConference@shortname{#2}%
  \fi}
\jocseConference[]{}{}{}
\def\jocseBooktitle#1{\gdef\@jocseBooktitle{#1}}
\jocseBooktitle{Proceedings of \jocseConference@name
       \ifx\jocseConference@name\jocseConference@shortname\else
         \ (\jocseConference@shortname)\fi}
\def\@editorsAbbrev{(Ed.)}
\def\@jocseEditors{}
\def\editor#1{\ifx\@jocseEditors\@empty
    \gdef\@jocseEditors{#1}%
  \else
    \gdef\@editorsAbbrev{(Eds.)}%
    \g@addto@macro\@jocseEditors{\and#1}%
\fi}
\def\subtitle#1{\def\@subtitle{#1}}
\subtitle{}
\newcount\num@authorgroups
\num@authorgroups=0\relax
\newcount\num@authors
\num@authors=0\relax
\newif\if@insideauthorgroup
\@insideauthorgroupfalse
\renewcommand\author[2][]{%
  \global\advance\num@authors by 1\relax
  \if@insideauthorgroup\else
    \global\advance\num@authorgroups by 1\relax
    \global\@insideauthorgrouptrue
  \fi
  \ifx\addresses\@empty
    \if@JOCSE@anonymous
      \gdef\addresses{\@author{Anonymous Author(s)}}%
      \gdef\authors{Anonymous Author(s)}%
    \else
      \gdef\addresses{\@author{#2}}%
      \gdef\authors{#2}%
    \fi
  \else
    \if@JOCSE@anonymous\else
      \g@addto@macro\addresses{\and\@author{#2}}%
      \g@addto@macro\authors{\and#2}%
    \fi
  \fi
  \if@JOCSE@anonymous
    \ifx\shortauthors\@empty
      \gdef\shortauthors{Anon.}%
    \fi
  \else
    \def\@tempa{#1}%
    \ifx\@tempa\@empty
      \ifx\shortauthors\@empty
        \gdef\shortauthors{#2}%
      \else
        \g@addto@macro\shortauthors{\and#2}%
      \fi
    \else
      \ifx\shortauthors\@empty
        \gdef\shortauthors{#1}%
      \else
        \g@addto@macro\shortauthors{\and#1}%
      \fi
    \fi
  \fi}
\newcommand{\affiliation}[2][]{%
  \global\@insideauthorgroupfalse
  \if@JOCSE@anonymous\else
    \g@addto@macro\addresses{\affiliation{#1}{#2}}%
  \fi}
\define@boolkey+{@JOCSE@affiliation@}[@JOCSE@affiliation@]{obeypunctuation}%
[true]{}{\ClassError{\@classname}{The option obeypunctuation can be either true or false}}
\def\additionalaffiliation#1{\authornote{\@additionalaffiliation{#1}}}
\def\@additionalaffiliation#1{\bgroup
  \def\position##1{\ignorespaces}%
  \def\institution##1{##1\ignorespaces}%
  \def\department{\@ifnextchar[{\@department}{\@department[]}}%
  \def\@department[##1]##2{\unskip, ##2\ignorespaces}%
  \let\streetaddress\position
  \let\city\position
  \let\state\position
  \let\postcode\position
  \let\country\position
  Also with #1\unskip.\egroup}
\renewcommand{\email}[2][]{%
  \if@JOCSE@anonymous\else
    \g@addto@macro\addresses{\email{#1}{#2}}%
  \fi}
\def\orcid#1{\unskip\ignorespaces}
\def\authorsaddresses#1{\def\@authorsaddresses{#1}}
\authorsaddresses{\@mkauthorsaddresses}
\def\@titlenotes{}
\def\titlenote#1{%
  \g@addto@macro\@title{\footnotemark}%
  \if@JOCSE@anonymous
    \g@addto@macro\@titlenotes{%
      \stepcounter{footnote}\footnotetext{Title note}}%
  \else
    \g@addto@macro\@titlenotes{\stepcounter{footnote}\footnotetext{#1}}%
  \fi}
\def\@subtitlenotes{}
\def\subtitlenote#1{%
  \g@addto@macro\@subtitle{\footnotemark}%
  \if@JOCSE@anonymous
    \g@addto@macro\@subtitlenotes{%
      \stepcounter{footnote}\footnotetext{Subtitle note}}%
  \else
    \g@addto@macro\@subtitlenotes{%
      \stepcounter{footnote}\footnotetext{#1}}%
  \fi}
\def\@authornotes{}
\def\authornote#1{%
  \if@JOCSE@anonymous\else
    \g@addto@macro\addresses{\@authornotemark}%
    \g@addto@macro\@authornotes{%
      \stepcounter{footnote}\footnotetext{#1}}%
  \fi}
\newcommand\authornotemark[1][\relax]{%
  \ifx#1\relax\relax\relax
  \g@addto@macro\addresses{\@authornotemark}%
  \else
  \g@addto@macro\addresses{\@@authornotemark{#1}}%
  \fi}
\def\jocseVolume#1{\def\@jocseVolume{#1}}
\jocseVolume{1}
\def\jocseNumber#1{\def\@jocseNumber{#1}}
\jocseNumber{1}
\def\jocsearticle#1{\def\@jocsearticle{#1}}
\jocsearticle{}
\def\jocsearticleSeq#1{\def\@jocsearticleSeq{#1}}
\jocsearticleSeq{\@jocsearticle}
\def\jocseYear#1{\def\@jocseYear{#1}}
\jocseYear{\the\year}
\def\jocseMonth#1{\def\@jocseMonth{#1}}
\jocseMonth{\the\month}
\def\@jocsePubDate{\ifcase\@jocseMonth\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or
  December\fi~\@jocseYear}
\def\jocsePrice#1{\def\@jocsePrice{#1}}
\jocsePrice{15.00}
\def\jocseSubmissionID#1{\def\@jocseSubmissionID{#1}}
\jocseSubmissionID{}
\def\jocseISSN#1{\def\@jocseISSN{#1}}
\jocseISSN{978-x-xxxx-xxxx-x/YY/MM}
\def\jocseDOI#1{\def\@jocseDOI{#1}}
\jocseDOI{10.22369/issn.2153-4136/x/x/x}
\newif\if@JOCSE@badge
\@JOCSE@badgefalse
\newlength\@JOCSE@badge@width
\setlength\@JOCSE@badge@width{5pc}
\newlength\@JOCSE@title@width
\newlength\@JOCSE@badge@skip
\setlength\@JOCSE@badge@skip{1pc}
\newcommand\jocseBadgeR[2][]{\@JOCSE@badgetrue
  \def\@jocseBadgeR@url{#1}%
  \def\@jocseBadgeR@image{#2}}
\def\@jocseBadgeR@url{}
\def\@jocseBadgeR@image{}
\newcommand\jocseBadgeL[2][]{\@JOCSE@badgetrue
  \def\@jocseBadgeL@url{#1}%
  \def\@jocseBadgeL@image{#2}}
\def\@jocseBadgeL@url{}
\def\@jocseBadgeL@image{}
\def\startPage#1{\def\@startPage{#1}}
\startPage{}
\def\terms#1{\ClassWarning{\@classname}{The command \string\terms{} is
    obsolete.  I am going to ignore it}}
\def\keywords#1{\def\@keywords{#1}}
\keywords{}
\renewenvironment{abstract}{\Collect@Body\@saveabstract}{}
\long\def\@saveabstract#1{\long\gdef\@abstract{#1}}
\@saveabstract{}
\long\def\@lempty{}
\define@boolkey+{@JOCSE@topmatter@}[@JOCSE@]{printccs}[true]{%
  \if@JOCSE@printccs
    \ClassInfo{\@classname}{Printing CCS}%
  \else
    \ClassInfo{\@classname}{Suppressing CCS}%
  \fi}{\ClassError{\@classname}{The option printccs can be either true or false}}
\define@boolkey+{@JOCSE@topmatter@}[@JOCSE@]{printjocseref}[true]{%
  \if@JOCSE@printjocseref
    \ClassInfo{\@classname}{Printing bibformat}%
  \else
    \ClassInfo{\@classname}{Suppressing bibformat}%
  \fi}{\ClassError{\@classname}{The option printjocseref can be either true or false}}
\define@boolkey+{@JOCSE@topmatter@}[@JOCSE@]{printfolios}[true]{%
  \if@JOCSE@printfolios
    \ClassInfo{\@classname}{Printing folios}%
  \else
    \ClassInfo{\@classname}{Suppressing folios}%
  \fi}{\ClassError{\@classname}{The option printfolios can be either true or false}}
\define@cmdkey{@JOCSE@topmatter@}[@JOCSE@]{authorsperrow}[0]{%
  \IfInteger{#1}{\ClassInfo{\@classname}{Setting authorsperrow to
      #1}}{\ClassWarning{\@classname}{The parameter authorsperrow must be
      numerical. Ignoring the input #1}\gdef\@JOCSE@authorsperrow{0}}}
\def\settopmatter#1{\setkeys{@JOCSE@topmatter@}{#1}}
\settopmatter{printccs=true, printjocseref=true}
\if@JOCSE@manuscript
  \settopmatter{printfolios=true}
\else
  \if@JOCSE@journal
    \settopmatter{printfolios=true}
  \else
    \settopmatter{printfolios=false}
  \fi
\fi
\settopmatter{authorsperrow=0}
\def\@received{}
\newcommand\received[2][]{\def\@tempa{#1}%
  \ifx\@tempa\@empty
    \ifx\@received\@empty
      \gdef\@received{Received #2}%
    \else
      \g@addto@macro{\@received}{; revised #2}%
    \fi
  \else
    \ifx\@received\@empty
      \gdef\@received{#1 #2}%
    \else
      \g@addto@macro{\@received}{; #1 #2}%
    \fi
  \fi}
\AtEndDocument{%
  \ifx\@received\@empty\else
    \par\bigskip\noindent\small\normalfont\@received\par
  \fi}
\RequirePackage{comment}
\excludecomment{CCSXML}
\let\@concepts\@empty
\newcommand\ccsdesc[2][100]{%
  \ccsdesc@parse#1~#2~~\ccsdesc@parse@end}
\RequirePackage{textcomp}
\def\ccsdesc@parse#1~#2~#3~{%
  \expandafter\ifx\csname CCS@General@#2\endcsname\relax
    \expandafter\gdef\csname CCS@General@#2\endcsname{\textbullet\
      \textbf{#2}}%
    \expandafter\gdef\csname CCS@Punctuation@#2\endcsname{; }%
    \expandafter\gdef\csname CCS@Specific@#2\endcsname{}%
  \g@addto@macro{\@concepts}{\csname CCS@General@#2\endcsname
    \csname CCS@Punctuation@#2\endcsname
    \csname CCS@Specific@#2\endcsname}%
  \fi
  \ifx#3\relax\relax\else
    \expandafter\gdef\csname CCS@Punctuation@#2\endcsname{
      \textrightarrow\ }%
    \expandafter\g@addto@macro\expandafter{\csname CCS@Specific@#2\endcsname}{%
     \ifnum#1>499\textbf{#3}; \else
     \ifnum#1>299\textit{#3}; \else
     #3; \fi\fi}%
  \fi
\ccsdesc@parse@finish}
\def\ccsdesc@parse@finish#1\ccsdesc@parse@end{}
\newif\if@printcopyright
\@printcopyrighttrue
\newif\if@printpermission
\@printpermissiontrue
\newif\if@jocseowned
\@jocseownedtrue
\define@choicekey*{JOCSE@}{jocsecopyrightmode}[%
  \jocse@copyrightinput\jocse@copyrightmode]{none,%
    jocsecopyright}{%
  \@printpermissiontrue
  \@printcopyrighttrue
  \@jocseownedfalse
  \ifnum\jocse@copyrightmode=0\relax % none
   \@printpermissionfalse
   \@printcopyrightfalse
   \@jocseownedfalse
  \fi}
\def\setcopyright#1{\setkeys{JOCSE@}{jocsecopyrightmode=#1}}
\setcopyright{jocsecopyright}
\def\@copyrightowner{%
  \ifcase\jocse@copyrightmode\relax % none
  \or % jocsecopyright
  Journal of Computational Science Education
  \fi}
\def\@formatdoi#1{\url{https://doi.org/#1}}
\def\@copyrightpermission{%
  \ifcase\jocse@copyrightmode\relax % none
  \or % jocsecopyright
   Permission to make digital or hard copies of all or part of this work for personal or classroom use is granted without fee provided that copies are not made or distributed for profit or commercial advantage and that copies bear this notice and the full citation on the first page. To copy otherwise, or republish, to post on servers or to redistribute to lists, requires prior specific permission and/or a fee. Copyright \copyright JOCSE, a supported publication of the Shodor Education Foundation Inc. \newline \fi}
\def\copyrightyear#1{\def\@copyrightyear{#1}}
\copyrightyear{\@jocseYear}
\def\@teaserfigures{}
\newenvironment{teaserfigure}{\Collect@Body\@saveteaser}{}
\long\def\@saveteaser#1{\g@addto@macro\@teaserfigures{\@teaser{#1}}}
\renewcommand{\thanks}[1]{%
  \@ifnotempty{#1}{%
    \if@JOCSE@anonymous
      \g@addto@macro\thankses{\thanks{A note}}%
   \else
    \g@addto@macro\thankses{\thanks{#1}}%
   \fi}}
\newbox\mktitle@bx
\def\maketitle{%
  \if@JOCSE@anonymous
    % Anonymize omission of \author-s
    \ifnum\num@authorgroups=0\author{}\fi
  \fi
  \begingroup
  \let\@footnotemark\@footnotemark@nolink
  \let\@footnotetext\@footnotetext@nolink
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \global\@topnum\z@ % this prevents floats from falling
                     % at the top of page 1
  \global\@botnum\z@ % we do not want them to be on the bottom either
  \hsize=\textwidth
  \def\@makefnmark{\hbox{\@textsuperscript{\@thefnmark}}}%
  \@mktitle\if@JOCSE@sigchiamode\else\@mkauthors\fi\@mkteasers
  \@printtopmatter
  \if@JOCSE@sigchiamode\@mkauthors\fi
  \setcounter{footnote}{0}%
  \def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}%
  \@titlenotes
  \@subtitlenotes
  \@authornotes
  \let\@makefnmark\relax
  \let\@thefnmark\relax
  \let\@makefntext\noindent
  \ifx\@empty\thankses\else
    \footnotetextauthorsaddresses{%
      \def\par{\let\par\@par}\parindent\z@\@setthanks}%
  \fi
  \ifx\@empty\@authorsaddresses\else
     \if@JOCSE@anonymous\else
       \if@JOCSE@journal
         \footnotetextauthorsaddresses{%
           \def\par{\let\par\@par}\parindent\z@\@setauthorsaddresses}%
       \fi
     \fi
  \fi
  \footnotetextcopyrightpermission{%
    \if@JOCSE@authordraft
        \raisebox{-2ex}[\z@][\z@]{\makebox[0pt][l]{\large\bfseries
            Unpublished working draft. Not for distribution.}}%
       \color[gray]{0.9}%
    \fi
    \parindent\z@\parskip0.1\baselineskip
    \if@JOCSE@authorversion\else
      \if@printpermission\@copyrightpermission\par\fi
    \fi
    \if@JOCSE@manuscript\else
       \if@JOCSE@journal\else % Print the conference information (obsolete!)
         %{\itshape \jocseConference@shortname, \jocseConference@date, \jocseConference@venue}\par
       \fi
    \fi
    \if@printcopyright
      \copyright\ \@copyrightyear\ \@copyrightowner\\
    \else
     \@copyrightyear.\
    \fi
    \if@JOCSE@manuscript
      Manuscript submitted to JOCSE\\
    \else
      \if@JOCSE@authorversion
          This is the author's version of the work. It is posted here for
          your personal use. Not for redistribution. The definitive Version
          of Record was published in
          \if@JOCSE@journal
            \emph{\@journalName}%
          \else
            \emph{\@jocseBooktitle}%
          \fi
          \ifx\@jocseDOI\@empty
          .
          \else
            , \@formatdoi{\@jocseDOI}.
          \fi\\
        \else
          \if@JOCSE@journal
            \@permissionCodeOne/\@jocseYear/\@jocseMonth-ART\@jocsearticle
            \ifx\@jocsePrice\@empty\else\ \$\@jocsePrice\fi\\
            \@formatdoi{\@jocseDOI}%
          \else % Conference
            \ifx\@jocseDOI\@empty\else\@formatdoi{\@jocseDOI}\fi%
          \fi
        \fi
      \fi}
  \endgroup
  \setcounter{footnote}{0}%
  \@mkabstract
  \if@JOCSE@printccs
    \ifx\@concepts\@empty\else\bgroup
      {\@specialsection{CCS Concepts}%
         \@concepts\par}\egroup
     \fi
   \fi
   \ifx\@keywords\@empty\else\bgroup
      {\if@JOCSE@journal
         \@specialsection{Additional Key Words and Phrases}%
       \else
         \@specialsection{Keywords}%
       \fi
         \@keywords}\par\egroup
   \fi
  \andify\authors
  \andify\shortauthors
  \global\let\authors=\authors
  \global\let\shortauthors=\shortauthors
  \if@JOCSE@printjocseref
     \@mkbibcitation
  \fi
  \hypersetup{%
    pdflang={English},
    pdfdisplaydoctitle,
    pdfauthor={\authors},
    pdftitle={\@title},
    pdfsubject={\@concepts},
    pdfkeywords={\@keywords},
    pdfcreator={LaTeX with jocseart
      \csname ver@jocseart.cls\endcsname\space
      and hyperref
      \csname ver@hyperref.sty\endcsname}}%
  \@printendtopmatter
  \@afterindentfalse
  \@afterheading
}
\def\@specialsection#1{%
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \par\medskip\small\noindent#1: %
  \or % jocsesmall
    \par\medskip\small\noindent#1: %
  \or % jocselarge
    \par\medskip\small\noindent#1: %
  \or % jocsetog
    \par\medskip\small\noindent#1: %
  \or % jocse
    \section*{#1}%
  \fi}
\def\@printtopmatter{%
  \ifx\@startPage\@empty
     \gdef\@startPage{1}%
  \else
     \setcounter{page}{\@startPage}%
  \fi
  \thispagestyle{firstpagestyle}%
  \noindent
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \box\mktitle@bx\par
  \or % jocsesmall
    \box\mktitle@bx\par
  \or % jocselarge
    \box\mktitle@bx\par
  \or % jocsetog
    \twocolumn[\box\mktitle@bx]%
  \or % jocse
    \twocolumn[\box\mktitle@bx]%
  \fi
}
\def\@mktitle{%
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \@mktitle@i
  \or % jocsesmall
    \@mktitle@i
  \or % jocselarge
    \@mktitle@i
  \or % jocsetog
    \@mktitle@i
  \or % jocse
    \@mktitle@iii
  \fi
}
\def\@titlefont{%
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \LARGE\sffamily\bfseries
  \or % jocsesmall
    \LARGE\sffamily\bfseries
  \or % jocselarge
    \LARGE\sffamily\bfseries
  \or % jocsetog
    \Huge\sffamily
  \or % jocse
    \Huge\sffamily\bfseries
  \fi}
\def\@subtitlefont{\normalsize
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \mdseries
  \or % jocsesmall
    \mdseries
  \or % jocselarge
    \mdseries
  \or % jocsetog
     \LARGE
  \or % jocse
     \LARGE\mdseries
  \fi}
\def\@mktitle@i{\hsize=\textwidth
  \@JOCSE@title@width=\hsize
  \ifx\@jocseBadgeL@image\@empty\else
    \advance\@JOCSE@title@width by -\@JOCSE@badge@width
    \advance\@JOCSE@title@width by -\@JOCSE@badge@skip
  \fi
  \ifx\@jocseBadgeR@image\@empty\else
    \advance\@JOCSE@title@width by -\@JOCSE@badge@width
    \advance\@JOCSE@title@width by -\@JOCSE@badge@skip
  \fi
  \setbox\mktitle@bx=\vbox{\noindent\@titlefont
    \ifx\@jocseBadgeL@image\@empty\else
      \raisebox{-.5\baselineskip}[\z@][\z@]{\href{\@jocseBadgeL@url}{%
          \includegraphics[width=\@JOCSE@badge@width]{\@jocseBadgeL@image}}}%
      \hskip\@JOCSE@badge@skip
    \fi
    \parbox[t]{\@JOCSE@title@width}{\raggedright
      \@titlefont\noindent
      \@title
  \ifx\@subtitle\@empty\else
    \par\noindent{\@subtitlefont\@subtitle}
  \fi}%
  \ifx\@jocseBadgeR@image\@empty\else
    \hskip\@JOCSE@badge@skip
    \raisebox{-.5\baselineskip}[\z@][\z@]{\href{\@jocseBadgeR@url}{%
        \includegraphics[width=\@JOCSE@badge@width]{\@jocseBadgeR@image}}}%
  \fi
  \par\bigskip}}%
\def\@mktitle@iii{\hsize=\textwidth
    \setbox\mktitle@bx=\vbox{\@titlefont\centering
      \@JOCSE@title@width=\hsize
      \if@JOCSE@badge
        \advance\@JOCSE@title@width by -2\@JOCSE@badge@width
        \advance\@JOCSE@title@width by -2\@JOCSE@badge@skip
        \parbox[b]{\@JOCSE@badge@width}{\strut
          \ifx\@jocseBadgeL@image\@empty\else
            \raisebox{-.5\baselineskip}[\z@][\z@]{\href{\@jocseBadgeL@url}{%
                \includegraphics[width=\@JOCSE@badge@width]{\@jocseBadgeL@image}}}%
          \fi}%
        \hskip\@JOCSE@badge@skip
      \fi
      \parbox[t]{\@JOCSE@title@width}{\centering\@titlefont
        \@title
        \ifx\@subtitle\@empty\else
          \par\noindent{\@subtitlefont\@subtitle}
        \fi
      }%
      \if@JOCSE@badge
        \hskip\@JOCSE@badge@skip
        \parbox[b]{\@JOCSE@badge@width}{\strut
          \ifx\@jocseBadgeR@image\@empty\else
            \raisebox{-.5\baselineskip}[\z@][\z@]{\href{\@jocseBadgeR@url}{%
                \includegraphics[width=\@JOCSE@badge@width]{\@jocseBadgeR@image}}}%
          \fi}%
      \fi
      \par\bigskip}}%
\def\@mktitle@iv{\hsize=\textwidth
    \setbox\mktitle@bx=\vbox{\raggedright\leftskip5pc\@titlefont
      \noindent\leavevmode\leaders\hrule height 2pt\hfill\kern0pt\par
      \noindent\@title
     \ifx\@subtitle\@empty\else
       \par\noindent\@subtitlefont\@subtitle
     \fi
     \par\bigskip}}%
\newbox\@JOCSE@commabox
\def\@JOCSE@addtoaddress#1{%
  \ifvmode\else
    \if@JOCSE@affiliation@obeypunctuation\else
    \setbox\@JOCSE@commabox=\hbox{, }%
    \unskip\cleaders\copy\@JOCSE@commabox\hskip\wd\@JOCSE@commabox
  \fi\fi
  #1}
\def\streetaddress#1{\unskip\ignorespaces}
\def\postcode#1{\unskip\ignorespaces}
\if@JOCSE@journal
  \def\position#1{\unskip\ignorespaces}
  \def\institution#1{\unskip~#1\ignorespaces}
  \def\city#1{\unskip\ignorespaces}
  \def\state#1{\unskip\ignorespaces}
  \newcommand\department[2][0]{\unskip\ignorespaces}
  \def\country#1{\if@JOCSE@affiliation@obeypunctuation\else, \fi#1\ignorespaces}
\else
  \def\position#1{\if@JOCSE@affiliation@obeypunctuation#1\else#1\par\fi}%
  \def\institution#1{\if@JOCSE@affiliation@obeypunctuation#1\else#1\par\fi}%
  \newcommand\department[2][0]{\if@JOCSE@affiliation@obeypunctuation
    #2\else#2\par\fi}%
  \let\city\@JOCSE@addtoaddress
  \let\state\@JOCSE@addtoaddress
  \let\country\@JOCSE@addtoaddress
\fi
\def\@mkauthors{\begingroup
  \hsize=\textwidth
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \@mkauthors@i
  \or % jocsesmall
    \@mkauthors@i
  \or % jocselarge
    \@mkauthors@i
  \or % jocsetog
    \@mkauthors@i
  \or % jocse
    \@mkauthors@iii
  \fi
  \endgroup
}
\def\@authorfont{\Large\sffamily}
\def\@affiliationfont{\normalsize\normalfont}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
  \def\@authorfont{\large\sffamily}
  \def\@affiliationfont{\small\normalfont}
\or % jocselarge
\or % jocsetog
  \def\@authorfont{\LARGE\sffamily}
  \def\@affiliationfont{\large}
\or % jocse
  \def\@authorfont{\LARGE}
  \def\@affiliationfont{\large}
\fi
\def\@typeset@author@line{%
  \andify\@currentauthors\par\noindent
  \@currentauthors\def\@currentauthors{}%
  \ifx\@currentaffiliations\@empty\else
    \andify\@currentaffiliations
      \unskip, {\@currentaffiliations}\par
  \fi
  \def\@currentaffiliations{}}
\def\@mkauthors@i{%
  \def\@currentauthors{}%
  \def\@currentaffiliations{}%
  \global\let\and\@typeset@author@line
  \def\@author##1{%
    \ifx\@currentauthors\@empty
      \gdef\@currentauthors{\@authorfont\MakeTextUppercase{##1}}%
    \else
       \g@addto@macro{\@currentauthors}{\and\MakeTextUppercase{##1}}%
    \fi
    \gdef\and{}}%
  \def\email##1##2{}%
  \def\affiliation##1##2{%
    \def\@tempa{##2}\ifx\@tempa\@empty\else
       \ifx\@currentaffiliations\@empty
          \gdef\@currentaffiliations{%
            \setkeys{@JOCSE@affiliation@}{obeypunctuation=false}%
            \setkeys{@JOCSE@affiliation@}{##1}%
            \@affiliationfont##2}%
       \else
         \g@addto@macro{\@currentaffiliations}{\and
           \setkeys{@JOCSE@affiliation@}{obeypunctuation=false}%
           \setkeys{@JOCSE@affiliation@}{##1}##2}%
      \fi
    \fi
     \global\let\and\@typeset@author@line}%
  \global\setbox\mktitle@bx=\vbox{\noindent\box\mktitle@bx\par\medskip
    \noindent\addresses\@typeset@author@line
   \par\medskip}%
}
\newbox\author@bx
\newdimen\author@bx@wd
\newskip\author@bx@sep
\author@bx@sep=1pc\relax
\def\@typeset@author@bx{\bgroup\hsize=\author@bx@wd\def\and{\par}%
  \global\setbox\author@bx=\vtop{\if@JOCSE@sigchiamode\else\centering\fi
    \@authorfont\@currentauthors\par\@affiliationfont
    \@currentaffiliation}\egroup
  \box\author@bx\hspace{\author@bx@sep}%
  \gdef\@currentauthors{}%
  \gdef\@currentaffiliation{}}
\def\@mkauthors@iii{%
  \author@bx@wd=\textwidth\relax
  \advance\author@bx@wd by -\author@bx@sep\relax
  \ifnum\@JOCSE@authorsperrow>0\relax
    \divide\author@bx@wd by \@JOCSE@authorsperrow\relax
  \else
    \ifcase\num@authorgroups
    \relax % 0?
    \or  % 1=one author per row
    \or  % 2=two authors per row
       \divide\author@bx@wd by \num@authorgroups\relax
    \or  % 3=three authors per row
       \divide\author@bx@wd by \num@authorgroups\relax
    \or  % 4=two authors per row (!)
       \divide\author@bx@wd by 2\relax
    \else % three authors per row
       \divide\author@bx@wd by 3\relax
    \fi
  \fi
  \advance\author@bx@wd by -\author@bx@sep\relax
  \gdef\@currentauthors{}%
  \gdef\@currentaffiliation{}%
  \def\@author##1{\ifx\@currentauthors\@empty
    \gdef\@currentauthors{\par##1}%
  \else
    \g@addto@macro\@currentauthors{\par##1}%
  \fi
  \gdef\and{}}%
  \def\email##1##2{\ifx\@currentaffiliation\@empty
    \gdef\@currentaffiliation{\nolinkurl{##2}}%
  \else
    \g@addto@macro\@currentaffiliation{\par\nolinkurl{##2}}%
  \fi}%
  \def\affiliation##1##2{\ifx\@currentaffiliation\@empty
    \gdef\@currentaffiliation{%
      \setkeys{@JOCSE@affiliation@}{obeypunctuation=false}%
      \setkeys{@JOCSE@affiliation@}{##1}##2}%
  \else
    \g@addto@macro\@currentaffiliation{\par
      \setkeys{@JOCSE@affiliation@}{obeypunctuation=false}%
      \setkeys{@JOCSE@affiliation@}{##1}##2}%
  \fi
  \global\let\and\@typeset@author@bx
}%
  \hsize=\textwidth
  \global\setbox\mktitle@bx=\vbox{\noindent
    \box\mktitle@bx\par\medskip\leavevmode
    \lineskip=1pc\relax\centering\hspace*{-1em}%
    \addresses\let\and\@typeset@author@bx\and\par\bigskip}}
\def\@mkauthors@iv{%
  \author@bx@wd=\columnwidth\relax
  \advance\author@bx@wd by -\author@bx@sep\relax
  \ifnum\@JOCSE@authorsperrow>0\relax
    \divide\author@bx@wd by \@JOCSE@authorsperrow\relax
  \else
    \ifcase\num@authorgroups
    \relax % 0?
    \or  % 1=one author per row
    \else  % 2=two authors per row
       \divide\author@bx@wd by 2\relax
    \fi
  \fi
  \advance\author@bx@wd by -\author@bx@sep\relax
  \gdef\@currentauthors{}%
  \gdef\@currentaffiliation{}%
  \def\@author##1{\ifx\@currentauthors\@empty
    \gdef\@currentauthors{\par##1}%
  \else
    \g@addto@macro\@currentauthors{\par##1}%
  \fi
  \gdef\and{}}%
  \def\email##1##2{\ifx\@currentaffiliation\@empty
    \gdef\@currentaffiliation{\nolinkurl{##2}}%
  \else
    \g@addto@macro\@currentaffiliation{\par\nolinkurl{##2}}%
  \fi}%
  \def\affiliation##1##2{\ifx\@currentaffiliation\@empty
    \gdef\@currentaffiliation{%
      \setkeys{@JOCSE@affiliation@}{obeypunctuation=false}%
           \setkeys{@JOCSE@affiliation@}{##1}##2}%
  \else
    \g@addto@macro\@currentaffiliation{\par
      \setkeys{@JOCSE@affiliation@}{obeypunctuation=false}%
      \setkeys{@JOCSE@affiliation@}{##1}##2}%
  \fi
  \global\let\and\@typeset@author@bx}%
    \bgroup\hsize=\columnwidth
    \par\raggedright\leftskip=\z@
    \lineskip=1pc\noindent
    \addresses\let\and\@typeset@author@bx\and\par\bigskip\egroup}
\def\@mkauthorsaddresses{%
  \ifnum\num@authors>1\relax
  Authors' \else Author's \fi
  \ifnum\num@authorgroups>1\relax
  addresses: \else address: \fi
  \bgroup
  \def\streetaddress##1{\unskip\@addpunct, ##1}%
  \def\postcode##1{\unskip\@addpunct, ##1}%
  \def\position##1{\unskip\ignorespaces}%
  \def\institution##1{\unskip\@addpunct, ##1}%
  \def\city##1{\unskip\@addpunct, ##1}%
  \def\state##1{\unskip\@addpunct, ##1}%
  \renewcommand\department[2][0]{\unskip\@addpunct, ##2}%
  \def\country##1{\unskip\@addpunct, ##1}%
  \def\and{\unskip\@addpunct; }%
  \def\@author##1{##1}%
  \def\email##1##2{\unskip\@addpunct, \nolinkurl{##2}}%
  \addresses
  \egroup}
\def\@setaddresses{}
\def\@authornotemark{\g@addto@macro\@currentauthors{\footnotemark\relax}}
\def\@@authornotemark#1{\g@addto@macro\@currentauthors{\footnotemark[#1]}}
\def\@mkteasers{%
  \ifx\@teaserfigures\@empty\else
    \def\@teaser##1{\par\bigskip\bgroup
      \captionsetup{type=figure}##1\egroup\par}
    \global\setbox\mktitle@bx=\vbox{\noindent\box\mktitle@bx\par
    \noindent\@teaserfigures\par\medskip}%
  \fi}
\def\@mkabstract{\bgroup
  \ifx\@abstract\@lempty\else
  {\phantomsection\addcontentsline{toc}{section}{Abstract}%
    \if@JOCSE@journal
       \everypar{\setbox\z@\lastbox\everypar{}}\small
    \else
      \section*{Abstract}%
    \fi
   \ignorespaces\@abstract\par}%
  \fi\egroup}
\def\@mkbibcitation{\bgroup
  \def\@pages@word{\ifnum\getrefnumber{TotPages}=1\relax page\else pages\fi}%
  \def\footnotemark{}%
  \def\\{\unskip{} \ignorespaces}%
  \def\footnote{\ClassError{\@classname}{Please do note use footnotes
      inside a \string\title{} or \string\author{} command! Use
      \string\titlenote{} or \string\authornote{} instead!}}%
  \def\@article@string{\ifx\@jocsearticle\@empty{\ }\else,
    Article~\@jocsearticle\ \fi}%
%  \par\medskip\small\noindent{\bfseries JOCSE Reference Format:}\par\nobreak
%  \noindent\authors. \@jocseYear. \@title
%  \ifx\@subtitle\@empty. \else: \@subtitle. \fi
%  \if@JOCSE@journal
%     \textit{\@journalNameShort}
%     \@jocseVolume, \@jocseNumber \@article@string (\@jocsePubDate),
%     \ref{TotPages}~\@pages@word.
%  \else
%     In \textit{\@jocseBooktitle}%
%     \ifx\@jocseEditors\@empty\textit{.}\else
%       \andify\@jocseEditors\textit{, }\@jocseEditors~\@editorsAbbrev.%
%     \fi\
%     JOCSE, New York, NY, USA%
%       \@article@string\unskip, \ref{TotPages}~\@pages@word.
%  \fi
% \ifx\@jocseDOI\@empty\else\@formatdoi{\@jocseDOI}\fi
\par\egroup}
\def\@printendtopmatter{\par\bigskip}
\def\@setthanks{\long\def\thanks##1{\par##1\@addpunct.}\thankses}
\def\@setauthorsaddresses{\@authorsaddresses\unskip\@addpunct.}
\RequirePackage{fancyhdr}
\if@JOCSE@review
  \newsavebox{\JOCSE@linecount@bx}
  \newlength\JOCSE@linecount@bxht
  \newcount\JOCSE@linecount
  \JOCSE@linecount\@ne\relax
  \def\JOCSE@mk@linecount{%
    \savebox{\JOCSE@linecount@bx}[4em][t]{\parbox[t]{4em}{%
        \setlength{\JOCSE@linecount@bxht}{0pt}%
        \loop{\color{red}\scriptsize\the\JOCSE@linecount}\\
        \global\advance\JOCSE@linecount by \@ne
        \addtolength{\JOCSE@linecount@bxht}{\baselineskip}%
        \ifdim\JOCSE@linecount@bxht<\textheight\repeat
        {\color{red}\scriptsize\the\JOCSE@linecount}\hfill
        \global\advance\JOCSE@linecount by \@ne}}}
\fi
\def\JOCSE@linecountL{%
  \if@JOCSE@review
  \JOCSE@mk@linecount
  \begin{picture}(0,0)%
    \put(-26,-22){\usebox{\JOCSE@linecount@bx}}%
  \end{picture}%
  \fi}
\def\JOCSE@linecountR{%
  \if@JOCSE@review
  \JOCSE@mk@linecount
  \begin{picture}(0,0)%
    \put(20,-22){\usebox{\JOCSE@linecount@bx}}%
  \end{picture}%
  \fi}
\if@JOCSE@timestamp
  % Subtracting 30 from \time gives us the effect of rounding down despite
  % \numexpr rounding to nearest
  \newcounter{JOCSE@time@hours}
  \setcounter{JOCSE@time@hours}{\numexpr (\time - 30) / 60 \relax}
  \newcounter{JOCSE@time@minutes}
  \setcounter{JOCSE@time@minutes}{\numexpr \time - \theJOCSE@time@hours * 60 \relax}
  \newcommand\JOCSE@timestamp{%
    \footnotesize%
    \ifx\@jocseSubmissionID\@empty\relax\else
    Submission ID: \@jocseSubmissionID.{ }%
    \fi
    \the\year-\two@digits{\the\month}-\two@digits{\the\day}{ }%
    \two@digits{\theJOCSE@time@hours}:\two@digits{\theJOCSE@time@minutes}{. }%
    Page \thepage\ of \@startPage--\pageref*{TotPages}.%
  }
\fi
\def\@shortauthors{\if@JOCSE@anonymous Anon.\else\shortauthors\fi}
\def\@headfootfont{\sffamily}
\fancypagestyle{standardpagestyle}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{\z@}%
  \renewcommand{\footrulewidth}{\z@}%
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \fancyhead[LE]{\JOCSE@linecountL\if@JOCSE@printfolios\thepage\fi}%
    \fancyhead[RO]{\if@JOCSE@printfolios\thepage\fi}%
    \fancyhead[RE]{\@shortauthors}%
    \fancyhead[LO]{\JOCSE@linecountL\shorttitle}%
    \fancyfoot[RO,LE]{\footnotesize Manuscript submitted to JOCSE}%
  \or % jocsesmall
    \fancyhead[LE]{\JOCSE@linecountL\@headfootfont\@jocsearticle\if@JOCSE@printfolios:\thepage\fi}%
    \fancyhead[RO]{\@headfootfont\@jocsearticle\if@JOCSE@printfolios:\thepage\fi}%
    \fancyhead[RE]{\@headfootfont\@shortauthors}%
    \fancyhead[LO]{\JOCSE@linecountL\@headfootfont\shorttitle}%
    \fancyfoot[RO,LE]{\footnotesize \@journalNameShort, Vol. \@jocseVolume, No.
    \@jocseNumber, Article \@jocsearticle.  Publication date: \@jocsePubDate.}%
  \or % jocselarge
    \fancyhead[LE]{\JOCSE@linecountL\@headfootfont
      \@jocsearticle\if@JOCSE@printfolios:\thepage\fi\quad\textbullet\quad\@shortauthors}%
    \fancyhead[LO]{\JOCSE@linecountL}%
    \fancyhead[RO]{\@headfootfont
      \shorttitle\quad\textbullet\quad\@jocsearticle\if@JOCSE@printfolios:\thepage\fi}%
    \fancyfoot[RO,LE]{\footnotesize \@journalNameShort, Vol. \@jocseVolume, No.
    \@jocseNumber, Article \@jocsearticle.  Publication date: \@jocsePubDate.}%
  \or % jocsetog
    \fancyhead[LE]{\JOCSE@linecountL\@headfootfont
      \@jocsearticle\if@JOCSE@printfolios:\thepage\fi\quad\textbullet\quad\@shortauthors}%
    \fancyhead[LO]{\JOCSE@linecountL}%
    \fancyhead[RE]{\JOCSE@linecountR}%
    \fancyhead[RO]{\@headfootfont
      \shorttitle\quad\textbullet\quad\@jocsearticle\if@JOCSE@printfolios:\thepage\fi\JOCSE@linecountR}%
    \fancyfoot[RO,LE]{\footnotesize \@journalNameShort, Vol. \@jocseVolume, No.
    \@jocseNumber, Article \@jocsearticle.  Publication date: \@jocsePubDate.}%
  \else % Proceedings
    \fancyfoot[C]{\if@JOCSE@printfolios\footnotesize\thepage\fi}%
    \fancyhead[LO]{\JOCSE@linecountL\@headfootfont\shorttitle}%
    \fancyhead[RE]{\@headfootfont\@shortauthors\JOCSE@linecountR}%
    \fancyhead[LE]{\JOCSE@linecountL\@headfootfont\jocseConference@shortname,
      \jocseConference@date, \jocseConference@venue}%
    \fancyhead[RO]{\@headfootfont\jocseConference@shortname,
      \jocseConference@date, \jocseConference@venue\JOCSE@linecountR}%
  \fi
  \if@JOCSE@sigchiamode
     \fancyheadoffset[L]{\dimexpr(\marginparsep+\marginparwidth)}%
  \fi
  \if@JOCSE@timestamp
     \fancyfoot[LO,RE]{\JOCSE@timestamp}
  \fi
}
\pagestyle{standardpagestyle}
\newdimen\@folio@wd
\@folio@wd=\z@
\newdimen\@folio@ht
\@folio@ht=\z@
\newdimen\@folio@voffset
\@folio@voffset=\z@
\def\@folio@max{1}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
  \@folio@wd=45.75pt\relax
  \@folio@ht=1.25in\relax
  \@folio@voffset=.2in\relax
  \def\@folio@max{8}
\or % jocselarge
  \@folio@wd=43.25pt\relax
  \@folio@ht=79pt\relax
  \@folio@voffset=.55in\relax
  \def\@folio@max{10}
\fi
\def\@folioblob{\@tempcnta=0\@jocsearticleSeq\relax
  \ifnum\@tempcnta=0\relax\else
  \loop
     \ifnum\@tempcnta>\@folio@max\relax
      \advance\@tempcnta by - \@folio@max
   \repeat
    \advance\@tempcnta by -1\relax
    \@tempdima=\@folio@ht\relax
    \multiply\@tempdima by \the\@tempcnta\relax
    \advance\@tempdima by -\@folio@voffset\relax
    \begin{picture}(0,0)
    \makebox[\z@]{\raisebox{-\@tempdima}{%
        \rlap{%
          \raisebox{-0.45\@folio@ht}[\z@][\z@]{%
            \rule{\@folio@wd}{\@folio@ht}}}%
        \parbox{\@folio@wd}{%
          \centering
          \textcolor{white}{\LARGE\sffamily\bfseries\@jocsearticle}}}}
  \end{picture}\fi}

\fancypagestyle{firstpagestyle}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{\z@}%
  \renewcommand{\footrulewidth}{\z@}%
  \ifcase\JOCSE@format@nr
  \relax % manuscript
    \fancyhead[L]{\JOCSE@linecountL}%
    \fancyfoot[RO,LE]{\if@JOCSE@printfolios\small\thepage\fi}%
    \fancyfoot[RE,LO]{\footnotesize Manuscript submitted to JOCSE}%
  \or % jocsesmall
    \fancyfoot[RO,LE]{\footnotesize \@journalNameShort, Vol. \@jocseVolume, No.
    \@jocseNumber, Article \@jocsearticle.  Publication date:
    \@jocsePubDate.}%
    \fancyhead[LE]{\JOCSE@linecountL\@folioblob}%
    \fancyhead[LO]{\JOCSE@linecountL}%
    \fancyhead[RO]{\@folioblob}%
    \fancyheadoffset[RO,LE]{0.6\@folio@wd}%
  \or % jocselarge
    \fancyfoot[RO,LE]{\footnotesize \@journalNameShort, Vol. \@jocseVolume, No.
    \@jocseNumber, Article \@jocsearticle.  Publication date:
    \@jocsePubDate.}%
    \fancyhead[RO]{\@folioblob}%
    \fancyhead[LE]{\JOCSE@linecountL\@folioblob}%
    \fancyhead[LO]{\JOCSE@linecountL}%
    \fancyheadoffset[RO,LE]{1.4\@folio@wd}%
  \or % jocsetog
    \fancyfoot[RO,LE]{\footnotesize \@journalNameShort, Vol. \@jocseVolume, No.
    \@jocseNumber, Article \@jocsearticle.  Publication date:
    \@jocsePubDate.}%
    \fancyhead[L]{\JOCSE@linecountL}%
    \fancyhead[R]{\JOCSE@linecountR}%
  \else % Conference proceedings
    \fancyhead[L]{\JOCSE@linecountL}%
    \fancyhead[R]{\JOCSE@linecountR}%
    \fancyfoot[C]{\if@JOCSE@printfolios\footnotesize\thepage\fi}%
  \fi
  \if@JOCSE@timestamp
    \ifnum\JOCSE@format@nr=0\relax % Manuscript
    \fancyfoot[LO,RE]{\JOCSE@timestamp\quad
      \footnotesize Manuscript submitted to JOCSE}
    \else
    \fancyfoot[LO,RE]{\JOCSE@timestamp}
    \fi
  \fi
}
\let\JOCSE@ps@plain\ps@plain
\let\JOCSE@ps@myheadings\ps@myheadings
\let\JOCSE@ps@headings\ps@headings
\def\JOCSE@restore@pagestyle{%
  \let\ps@plain\JOCSE@ps@plain
  \let\ps@myheadings\JOCSE@ps@myheadings
  \let\ps@headings\JOCSE@ps@headings}
\AtBeginDocument{\JOCSE@restore@pagestyle}
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-.75\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {.25\baselineskip}%
  {\@secfont}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-.75\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {.25\baselineskip}%
  {\@subsecfont}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{10pt}%
  {-.5\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {-3.5\p@}%
  {\@subsubsecfont\@adddotafter}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\parindent}%
  {-.5\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {-3.5\p@}%
  {\@parfont\@adddotafter}}
\renewcommand\part{\@startsection{part}{9}{\z@}%
  {-10\p@ \@plus -4\p@ \@minus -2\p@}%
  {4\p@}%
  {\@parfont}}
\def\section@raggedright{\@rightskip\@flushglue
  \rightskip\@rightskip
  \leftskip\z@skip
  \parindent\z@}
\def\@secfont{\sffamily\bfseries\section@raggedright\MakeTextUppercase}
\def\@subsecfont{\sffamily\bfseries\section@raggedright}
\def\@subsubsecfont{\sffamily\itshape}
\def\@parfont{\itshape}
\setcounter{secnumdepth}{3}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
\or % jocselarge
 \def\@secfont{\sffamily\large\section@raggedright\MakeTextUppercase}
 \def\@subsecfont{\sffamily\large\section@raggedright}
\or % jocsetog
 \def\@secfont{\sffamily\large\section@raggedright\MakeTextUppercase}
 \def\@subsecfont{\sffamily\large\section@raggedright}
\or % jocse
 \def\@secfont{\bfseries\Large\section@raggedright\MakeTextUppercase}
 \def\@subsecfont{\bfseries\Large\section@raggedright}
\fi
\def\@adddotafter#1{#1\@addpunct{.}}
\def\@addspaceafter#1{#1\@addpunct{\enspace}}
\providecommand*\@dotsep{4.5}
\def\@jocseplainbodyfont{\itshape}
\def\@jocseplainindent{\parindent}
\def\@jocseplainheadfont{\scshape}
\def\@jocseplainnotefont{\@empty}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
\or % jocselarge
\or % jocsetog
\or % jocse
\fi
\newtheoremstyle{jocseplain}%
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space above
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space below
  {\@jocseplainbodyfont}% body font
  {\@jocseplainindent}% indent amount
  {\@jocseplainheadfont}% head font
  {.}% punctuation after head
  {.5em}% spacing after head
  {\thmname{#1}\thmnumber{ #2}\thmnote{ {\@jocseplainnotefont(#3)}}}% head spec
\def\@jocsedefinitionbodyfont{\normalfont}
\def\@jocsedefinitionindent{\parindent}
\def\@jocsedefinitionheadfont{\itshape}
\def\@jocsedefinitionnotefont{\@empty}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
\or % jocselarge
\or % jocsetog
\or % jocse
\fi
\newtheoremstyle{jocsedefinition}%
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space above
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space below
  {\@jocsedefinitionbodyfont}% body font
  {\@jocsedefinitionindent}% indent amount
  {\@jocsedefinitionheadfont}% head font
  {.}% punctuation after head
  {.5em}% spacing after head
  {\thmname{#1}\thmnumber{ #2}\thmnote{ {\@jocsedefinitionnotefont(#3)}}}% head spec
\theoremstyle{jocseplain}
\AtEndPreamble{%
  \if@JOCSE@jocsethm
  \theoremstyle{jocseplain}
  \@ifundefined{theorem}{%
  \newtheorem{theorem}{Theorem}[section]
  }{}
  \@ifundefined{conjecture}{%
  \newtheorem{conjecture}[theorem]{Conjecture}
  }{}
  \@ifundefined{proposition}{%
  \newtheorem{proposition}[theorem]{Proposition}
  }{}
  \@ifundefined{lemma}{%
  \newtheorem{lemma}[theorem]{Lemma}
  }{}
  \@ifundefined{corollary}{%
  \newtheorem{corollary}[theorem]{Corollary}
  }{}
  \theoremstyle{jocsedefinition}
  \@ifundefined{example}{%
  \newtheorem{example}[theorem]{Example}
  }{}
  \@ifundefined{definition}{%
  \newtheorem{definition}[theorem]{Definition}
  }{}
  \fi
  \theoremstyle{jocseplain}
}
\def\@proofnamefont{\scshape}
\def\@proofindent{\indent}
\ifcase\JOCSE@format@nr
\relax % manuscript
\or % jocsesmall
\or % jocselarge
\or % jocsetog
\or % jocse
\fi
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\@proofindent\hskip\labelsep
        {\@proofnamefont #1\@addpunct{.}}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\specialcomment{acks}{%
  \begingroup
  \section*{Acknowledgments}
  \phantomsection\addcontentsline{toc}{section}{Acknowledgments}
}{%
  \endgroup
}
\def\grantsponsor#1#2#3{#2}
\newcommand\grantnum[3][]{#3%
  \def\@tempa{#1}\ifx\@tempa\@empty\else\space(\url{#1})\fi}
\AtEndPreamble{%
\if@JOCSE@screen
  \includecomment{screenonly}
  \excludecomment{printonly}
\else
  \excludecomment{screenonly}
  \includecomment{printonly}
\fi
\if@JOCSE@anonymous
  \excludecomment{anonsuppress}
  \excludecomment{acks}
\else
  \includecomment{anonsuppress}
\fi}
\newcommand\showeprint[2][arxiv]{%
  \def\@tempa{#1}%
  \ifx\@tempa\@empty\def\@tempa{arxiv}\fi
  \def\@tempb{arxiv}%
  \ifx\@tempa\@tempb
     arXiv:\href{http://arxiv.org/abs/#2}{#2}\else arXiv:#2%
  \fi}
\normalsize\normalfont\frenchspacing
\endinput
%%
%% End of file `jocseart.cls'.
