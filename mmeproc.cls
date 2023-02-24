%%
%% Author: Michal Houda
%% E-mail: houda at ef dot jcu dot cz
%%
%% Modified by: Stanislav Tvrz
%% E-mail: tvrz at mail dot muni dot cz
%%
%% Modified by: Miroslav Vavrousek
%% E-mail: miroslav dot vavrousek at tul dot cz
%%
%% Noobishly modified by: Miroslav Rada
%% E-mail: miroslav dot rada at vse dot cz
%% Edited lines or blocks commented by ``MR''.
%% The main aim of the changes was to make all similar to MS Word
%% template with no excesive pain.
%%
%% Modified by: Michal Houda (v. 2.0)
%% change of the class name back to mmeproc
%% several modifications made (use of XeLaTeX possible)
%%
%% Modified by: Jiri Rybicka and Jan Prichystal (v. 2020)
%% few typographical modifications
%%
%% Description: this is a LaTeX class for contributions to the
%%   Proceedings of the International Conference on
%%   Mathematical Methods in Economics
%%
%% This program may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}[1997/06/01]
\ProvidesClass{mmeproc}
  [2019/01/22 v2.0 MME Proceedings class for LaTeX 2e]
%%
%% redefining internal point size to be a big (Postscript) point (Word compatibility)
%%
\p@=1bp\relax
%%
%% loading the base (article) class with different default options
%%
\DeclareOption*{%
  \PackageError{mmeproc}{`\CurrentOption' not allowed for use in production environment!}%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\PassOptionsToClass{10pt,a4paper}{article}
\LoadClass{article}
%%
%% loading some packages which should be loaded early
%%
\RequirePackage{amsmath,amsthm,amssymb}  % advanced mathematics
%%
%% loading the English language, UTF-8 input encoding, and basic typefaces
%%
\RequirePackage{ifxetex}
\ifxetex
  \RequirePackage{polyglossia,unicode-math}
  \setdefaultlanguage{english}
  \IfFontExistsTF{Times New Roman}{\def\mmeproc@mainfont{Times New Roman}}{\def\mmeproc@mainfont{Times}}
  \IfFontExistsTF{TeX Gyre Termes}{\def\mmeproc@mainfont{TeX Gyre Termes}}{}
  \IfFontExistsTF{TeX Gyre Termes Math}{\def\mmeproc@mathfont{TeX Gyre Termes Math}}{}
  % use TeX Gyre family if available - a free replacement of Times Roman font, based on URW++ Nimbus Roman font
  \setmainfont{\mmeproc@mainfont}
  \ifx\mmeproc@mathfont\undefined\else\setmathfont{\mmeproc@mathfont}\fi
\else
  \RequirePackage[english]{babel}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \IfFileExists{mathptmx.sty}{\def\mmeproc@mainfont{mathptmx}}{\def\mmeproc@mainfont{times}}
  \IfFileExists{newtxtext.sty}{\def\mmeproc@mainfont{newtxtext,newtxmath}}{}
  % Times replacement with math support (NewTX preferable)
  \RequirePackage{\mmeproc@mainfont}
\fi
%%
%% some dimensions are hard-coded into LaTeX or the article class
%% changed here - em/ex-sizes are changed by fontspec (loaded by polyglossia)
%%
\input{size1\@ptsize bp.clo}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                    PAGE DIMENSIONS AND FORMATTING                     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% (2.5cm margins on both sides regardless of the paper size)
%%
\RequirePackage{geometry}
\geometry{%
  a4paper,twoside,
  top=25mm,headsep=17pt,
  bottom=25mm,footskip=13.5mm,
  left=25mm, % inner margin
  right=25mm % outer margin
}
\parindent 0\p@           % JRJP: layout changes 
\parskip .5\baselineskip  % JRJP: layout changes
%\parskip=6\p@ plus 1\p@  % MR: commented plus part to fix parskip
\raggedbottom             % MR: no stretching, as in MS Word. It's ugly, but the Word template does it so.
%\linespread{0.957}       % MR: similar linespread as in Rord template
% MH(2.0): stretching allowed again although the Word template does not do it
% MH(2.0): linespread adjustment not needed due to the change of the internal definition of the LaTeX point
% MH(2.0): baselineskip defaults to 12bp (as in MS Word)
%\pagestyle{empty}
\pagestyle{plain}         % JRJP: page numbering for authors only
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                           HEADINGS                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% only section and subsections are numbered within an article
%%
\setcounter{secnumdepth}{2}
%%
%% MH: standard LaTeX spacing shifted: section <- subsection <- subsubsection
%% MR: fixed spacing
%% MH(2.0): spacing redefined: Word template modified, stretching allowed again
%% note: 1em = 10bp, 1ex = 4.5bp (at 10bp size)
%% due to the parskip defined as "space before" in MS Word, spacing here
%% has to be modified accordingly
\renewcommand\section{\@startsection {section}{1}{\z@}%
    {-1.92ex \@plus -1ex \@minus -.2ex}%    % MR: {-6pt plus 0pt minus 0pt}%    % MH(2.0): space before 8.55bp + 6bp = 14.55bp
    {0.75\p@ \@plus.2ex}%                    % MR: {1pt plus 0pt minus 0pt}%    % MH(2.0): space after  0.75bp + 6bp = 6.75bp
    {\normalfont\Large\bfseries}}%          % MR: \fontsize{14pt}{15.4pt}%      % MH(2.0): {14.4bp}{18bp}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
    {-3\p@ \@plus -1ex \@minus -.2ex}%      % MR: {-6pt plus 0pt minus 0pt}%    % MH(2.0): 9bp
    {0.5\p@ \@plus .2ex}%                   % MR: {0.5pt plus 0pt minus 0pt}%   % MH(2.0): 6.5bp
    {\normalfont\large\bfseries}}%          % MR: \fontsize{12pt}{13.2pt}%      % MH(2.0): {12bp}{14bp}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {-0.75\p@ \@plus -1ex \@minus -.2ex}%    % MR: {-6pt plus 0pt minus 0pt}%    % MH(2.0): 6.75bp
    {0.05\p@ \@plus 0.2ex}%                   % MR: {0.1pt plus 0pt minus 0pt}%   % MH(2.0): 6.05bp
    {\normalfont\normalsize\bfseries}}%
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                               FOOTNOTES                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%% modification of \@makecol (see original version in latex.ltx)
%% -- the footnote is `vfilled'
%%
\gdef \@makecol {%
   \ifvoid\footins
     \setbox\@outputbox \box\@cclv
   \else
     \setbox\@outputbox \vbox {%
       \boxmaxdepth \@maxdepth
       \unvbox \@cclv
       \vskip \skip\footins
       \vfill                   % <<--------- inserted
       \color@begingroup
         \normalcolor
         \footnoterule
         \unvbox \footins
       \color@endgroup
       }%
   \fi
   \let\@elt\relax
   \xdef\@freelist{\@freelist\@midlist}%
   \global \let \@midlist \@empty
   \@combinefloats
   \ifvbox\@kludgeins
     \@makespecialcolbox
   \else
     \setbox\@outputbox \vbox to\@colht {%
       \@texttop
       \dimen@ \dp\@outputbox
       \unvbox \@outputbox
       \vskip -\dimen@
       \@textbottom
       }%
   \fi
   \global \maxdepth \@maxdepth
}
%%
%%
%\RequirePackage[hang,flushmargin]{footmisc} % MR: footnotes without indentation
%% MH(2.0): not used, footnotes modified in the Word template
%% Additional modifications:
%% - box width 1.2em instead of 1.8em
%% - hspace 3bp after footnotemark
\renewcommand\@makefntext[1]{%
  \parindent 1em%
  \noindent
  \hb@xt@1.2em{\hss\@makefnmark\hspace{3\p@}}#1}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                              LISTS                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Modified enumerate and itemize environments
\RequirePackage{enumitem}
\setlist{topsep=0pt, noitemsep, align=left, labelwidth=15pt,
  labelsep=0pt, leftmargin=20pt,
  before={\parskip=0pt}, after=\vspace*{\parskip}%
}
%\setlist[itemize,2]{label=\textbullet}
\setlist[itemize,2]{label=--}
\setlist[enumerate,2]{label=\alph*)}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                             THEOREMS                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Theorems are defined using amsthm style file (package already loaded)
%%
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{proposition}[theorem]{Proposition}
%
\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{example}{Example}
\newtheorem{remark}{Remark}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                              BIBLIOGRAPHY                             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
\RequirePackage[numbers]{natbib}       % MR: for bibsep and for other stuff.
\bibsep=2bp
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                             TITLE PAGE                                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
\def\cleartitleinfo{\gdef\@author{No Author Given}%
                   \gdef\@title{No Title Given}%
                   \gdef\@institute{No Institute Given}%
                   \gdef\@thanks{}%
                   \gdef\@keywords{No Keyword Given}%
                   \gdef\@amssubjclass{}%
                   \gdef\@jelsubjclass{}%
}
\AtBeginDocument{\cleartitleinfo}
%%
%% Author information
%%
\def\mmeproc@authors{
  \vspace*{-2bp}%             % MR: commented out as requested by MME 2016 organizators
  {\def\and{\mmeproc@and@author}
    \large \@author\footnote{%
      \@institute
      \if:\@email:\else, \@email\fi
    }\vskip 3bp%               % MR, MH(2.0): modified spacing
}}
\def\mmeproc@and@author{%     % Author name is here already typeset,
  \footnote{%
    {\@institute\if:\@email:\else, \@email\fi}\relax
  },
}%   % the next author
%%
%% Other titlepage information
%%
\def\email#1{\gdef\@email{#1}}
\def\institute#1{\gdef\@institute{#1}}%
\def\keywords#1{\gdef\@keywords{#1}}%
\def\amssubjclass#1{\gdef\@amssubjclass{%
  \textbf{AMS Classification:} #1}}%
\def\jelsubjclass#1{\gdef\@jelsubjclass{%
  \textbf{JEL Classification:} #1}}%
%%
%% Changes to the original LaTeX abstract environment
%% This does not work with the titlepage and twocolumn options!
%%
\newbox\mmeproc@abstractbox
\renewenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{mmeproc}{Abstract should precede
      \protect\maketitle\space in mmeproc class}%
  \fi
  \global\setbox\mmeproc@abstractbox=\hbox to 12cm
  \bgroup\begin{minipage}{12cm}\parskip=0pt   % MR modified \parskip
  \textbf{\abstractname.}%
}{\end{minipage}\egroup}
%%
%% Making titlepage
%%
%%%% MR: command maketitle from article class
\def\maketitle{\par         % MR: commented out
  \begingroup
    %%% MR: custom footnote handling commented out
    %\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    %\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    %\long\def\@makefntext##1{\parindent 1em\noindent
            %\hb@xt@1.8em{%
                %\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage              % MR: commented out
      \global\@topnum\z@%   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}\@thanks
  \endgroup
  \setcounter{footnote}{0}%             % MR: commented out for continuously numbered footnotes
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
%%%% MR: end of inserted maketitle
%%
\def\@maketitle{%
  \newpage
  \vspace*{-1.75em}%   % MR: -19.5bp
  \begin{center}
    {\LARGE\bfseries \@title \par}%
    \mmeproc@authors\par
    \begin{minipage}{12cm}
      \parindent=\z@\parskip=6\p@
      \box\mmeproc@abstractbox\par
      \vspace*{4bp}

    {\bfseries\noindent Keywords:} \@keywords\par
    \@jelsubjclass\parskip\z@\par
    \@amssubjclass\medskip\par
    \end{minipage}
  \end{center}
%
\pagestyle{empty}
}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                              OTHER STUFF                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Inclusion of graphics
%%
\RequirePackage{graphicx}
%%
%% Table stretching
%%
\renewcommand\arraystretch{1.2}
%%
%% Caption style modification (bold caption headers).
%%
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\bfseries #1}\quad #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%%
%% Akcknowledgements
%%
\def\acknowledgements{\section*{Acknowledgements}}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           ONLY FOR THE PRODUCTION VERSION OF THE PROCEEDINGS          %%
%%                          (not used currently)                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environment article: setting starting page number
%% The command \startpageno sets the page number to the specified value
%%
%\newcommand\startpageno[1]{\c@page=#1}
\newenvironment{article}[1][1]{%
  \startpageno{#1}         % the starting page number
  \maketitle
}{\relax}
%%
%%
\endinput
%%
%% End of file `mmeproc.cls'.
