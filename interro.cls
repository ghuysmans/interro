\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{interro}[2022/05/23 Interrogations]
\LoadClass[addpoints,12pt,a4paper,oneside]{exam}
\unframedsolutions
\pointsinrightmargin
\pointname{}
\pointformat{/\thepoints}
\bonuspointname{}
\bonuspointformat{/+\thepoints}
\renewcommand{\solutiontitle}{\noindent\textbf{Solution :}\enspace}
\RequirePackage{hyperref}
\RequirePackage[T1]{fontenc}
\RequirePackage[french]{babel}
\RequirePackage[utf8]{inputenc}

\makeatletter
\renewcommand{\l}{\phantom{j}}
\newcommand{\interro@info}[1]{
  \textsc{#1} : & \begin{tabular}{|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|}
    \l & \l & \l &
    \l & \l & \l &
    \l & \l & \l &
    \l & \l & \l &
    \l & \l & \l \\ \hline
  \end{tabular}
}
\renewcommand{\maketitle}{
  \begin{center}
    \Large\@title
    \marginpar{\hfill\Large/\numpoints}

    \normalsize\@date
    \vskip 0.3cm
    \ifprintanswers
    \else
      \begin{tabular}{rl}
        \interro@info{Nom} \\
        \interro@info{Prénom} \\
        \textsc{Classe} : & \interro@target \\
      \end{tabular}
    \fi
  \end{center}
}

\newcommand{\targetfirst}{
\newcommand{\interro@target}{
  \begin{tabular}{|l|l|}
    \l & \l \\ \hline
  \end{tabular}
}}

\newcommand{\targetcg}[3]{
\newcommand{\interro@target}{
  %TODO use Babel to compute the superscript part
  #1\textsuperscript{#2} #3
  \begin{tabular}{|l|}
  \l \\ \hline
  \end{tabular}
}}

%derived from https://tex.stackexchange.com/a/272056
\newcommand*{\ExamResetAfterFirstRun}{%
  \renewcommand*{\PgInfo@write}[1]{}%
  \renewcommand*{\label}[1]{\@bsphack\@esphack}%
}
\makeatother

\newcommand{\teacheronly}[1]{
  \ifprintanswers
  #1
  \else
  \phantom{#1}
  \fi
}

\newcommand{\teacherorfill}[1]{
  \ifprintanswers
  #1
  \else
  \dotfill
  \fi
}

\newcommand*{\NewCopy}{%
  \setcounter{page}{1}
  \stepcounter{copynum}
  \setcounter{section}{0}
  \setcounter{figure}{0}
  \setcounter{question}{0}
  \setcounter{partno}{1}
  \setcounter{numquestions}{0}
  \setcounter{numpoints}{0}
  \setcounter{numbonuspoints}{0}
  \setcounter{numparts}{0}
  \setcounter{numsubparts}{0}
  \setcounter{numsubsubparts}{0}
  \ifnum\value{copynum}>1 %
    \ExamResetAfterFirstRun
  \fi
}
\newcounter{copynum}
