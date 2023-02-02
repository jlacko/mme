%%TEMPLATE_SMSIS
%%
%% Author: Lucie Chytilova
%% E-mail: Lucie.Chytilova@vsb.cz
%%
%% Description: this is a LaTeX class for contributions to the 
%% Proceedings of the International Conference on
%% Strategic Management and its Support by Information Systems
%% 
%% This program may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{smsisproc}
[2012/06/13 v1.1 SMSIS Proceedings class for LaTeX 2e]
%%
%%
%% Using article class, no additional options allowed
%%
\LoadClass[12.5pt,a4paper]{article}
%%
%% Some preloaded packages
%%
\RequirePackage{geometry}       				% page dimensions
\RequirePackage{graphicx}       				% including graphic files
\RequirePackage{amsmath,amsthm,amssymb}  	% advanced mathematics
\RequirePackage{enumitem}       				% modified enumerate environment
\RequirePackage{times}
\RequirePackage[flushmargin,hang]{footmisc}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE DIMENSIONS AND FORMATTING                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 
%%
\geometry{
  a4paper,twoside,
  top=20.3mm,headsep=17pt,
  bottom=28.5mm,footskip=13.5mm,
  left=25mm, 								% inner margin
  right=25mm, 								% outer margin
}
\parskip=6pt plus 1pt
%%
%% Page numbering
%%
\pagestyle{empty}
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TITLE PAGE                                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
\def\cleartitleinfo{\gdef\@author{No Author Given}
                   \gdef\@title{No Title Given}
                   \gdef\@institute{No Institute Given}
                   \gdef\@thanks{}
                   \gdef\@keywords{}
                   \gdef\@amssubjclass{}
                   \gdef\@jelsubjclass{}
}
\AtBeginDocument{\cleartitleinfo}
%%
%% Author information
%%
\def\smsisproc@authors{
  \vskip 0.8em 								%the gap between authors and heading
  {\def\and{\smsisproc@and@author}
    \large \@author\footnote{\normalsize
      \@institute
      \if:\@email:\else, \@email\fi
    }\vskip 2.5pt
}}
\def\smsisproc@and@author{\footnote{\normalsize
    {\@institute\if:\@email:\else, \@email\fi}\relax
  } ,  										%another author could be added as well 
} 
%%
%% Other title-page information
%%
\def\email#1{\gdef\@email{#1}}
\def\institute#1{\gdef\@institute{#1}}%
\def\keywords#1{\gdef\@keywords{#1}}%
\def\amssubjclass#1{\gdef\@amssubjclass{ #1}}%
\def\jelsubjclass#1{\gdef\@jelsubjclass{%
  \textbf{JEL classification:} #1}}%
%%
%% Changes to the original LaTeX abstract environment
%%
\newbox\smsisproc@abstractbox
\renewenvironment{abstract}{
  \ifx\maketitle\relax
    \ClassWarning{smsisproc}{Abstract should precede
      \protect\maketitle\space in smsisproc class}
  \fi
  \global\setbox\smsisproc@abstractbox=\hbox to 12cm
  \bgroup\begin{minipage}{12cm}\parskip=6pt
  \textbf{\abstractname.}
}{\end{minipage}\egroup}
%%
%% Making title-page
%%
\def\@maketitle{
  \def\thefootnote{\hspace{-0.15cm}\@arabic\c@footnote} %hspace put the index close to the name
  \newpage
  \null
  \vskip 2em
  \begin{center}
    {\fontsize{18pt}{10pt}\selectfont\bfseries \@title \par}
    \selectfont\smsisproc@authors\par
    \begin{minipage}{12cm}
      \parindent=\z@\parskip=6pt
      \box\smsisproc@abstractbox\par
	\fontsize{11pt}{13pt}\selectfont
    \textbf{Keywords:} \@keywords\par
    \@jelsubjclass\parskip\z@\par
    \@amssubjclass\par
    \end{minipage}
  \end{center}
\pagestyle{empty}
}

\renewcommand\footnoterule{
  \vspace{1.3em}								% one line space between text and footnoterule
  \kern-4\p@\hrule\@width.4\columnwidth			
  \kern4.5\p@}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADINGS                                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% only section and subsections are numbered within an article
%%
\setcounter{secnumdepth}{2}
%%
%% spacing shifted section & subsection & subsubsection
%%
\renewcommand\section{\@startsection {section}{1}{\z@}
                                   {-0.1ex \@plus -1ex \@minus -.2ex} 
                                   {0.3ex \@plus.2ex}
                                   {\normalfont\fontsize{14pt}{1pt}\selectfont\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}
                                     {-1.1ex\@plus -1ex \@minus -.2ex}
                                     {0.3ex \@plus .2ex}
                                     {\normalfont\fontsize{13pt}{16pt}\selectfont\bfseries}}
\renewcommand\subsubsection{\@startsection{subsection}{3}{\z@}
                                     {-1.1ex\@plus -1ex \@minus -.2ex}
                                     {0.3ex \@plus .2ex}
                                     {\normalfont\fontsize{12pt}{16pt}\selectfont\bfseries}}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LISTS                                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  Modified enumerate and itemize environments
%%
\renewcommand{\labelitemi}{\scalebox{0.45}{$\blacksquare$}}
\renewcommand{\theenumi}{\arabic{enumi}} 
\renewcommand{\labelenumi}{\theenumi)}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\labelenumii}{\theenumii)}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                             THEOREMS                                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{proposition}[theorem]{Proposition}
%%
\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{example}{Example}
\newtheorem{remark}{Remark}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                             OTHER                                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Table stretching
%%
\renewcommand\arraystretch{1.2}
%%
%% Caption style modification (bold caption headers).
%%
\long\def\@makecaption#1#2{
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\bf #1} #2}
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}
  \fi
  \vskip\belowcaptionskip}
%%
%% Environment article: setting starting page number
%% only for the production version of the proceedings
%%
\newenvironment{article}[1][1]{%
  \startpageno{#1}         % the starting page number
  \maketitle
}{\relax}
\def\acknowledgements{\section*{Acknowledgements}}
%%
%% End of file `smsisproc.cls'.
%%