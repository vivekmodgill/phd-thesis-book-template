\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisbook}[2026/10/13 Thesis book class, based on the RadboudReport class]
% Derived from the RadboudReport LaTeX class. The original author's copyright and
% licence terms continue to apply to the derived parts of this file.

% -----------------------------------------------------------------------------
%                                     COLOR
% -----------------------------------------------------------------------------
% Neutral grey palette. These names are kept so that the class defaults still
% resolve; bookformat.tex overrides the heading, list and contents colours.
\RequirePackage{xcolor}
\definecolor{redimpact}{gray}{0.35}
\definecolor{poppy}{gray}{0.45}
\definecolor{ladybug}{gray}{0.30}
\definecolor{berry}{gray}{0.20}
\definecolor{maroon}{gray}{0.15}
\definecolor{mahogany}{gray}{0.10}
\definecolor{tableheader}{HTML}{9697A1}
\definecolor{tablerowodd}{HTML}{FFFFFF}
\definecolor{tableroweven}{HTML}{E3E3E7}

% -----------------------------------------------------------------------------
%                                     FONTS
% -----------------------------------------------------------------------------
% Changes the default font in the document to Open Sans. Also change the
% distance between default lines of text.
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\renewcommand{\normalsize}{\fontsize{9}{12}\selectfont}
\IfFileExists{opensans.sty}{\RequirePackage[defaultsans, default]{opensans}}%
  {\ClassWarning{thesisbook}{opensans.sty not found; using the default font}}
\RequirePackage[letterspace=-30]{microtype}

% Make sure that the most used text formatting commands use the Open Sans font
% as well.
\DeclareRobustCommand\ebseries{\fontseries{eb}\selectfont}
\DeclareRobustCommand\sbseries{\fontseries{sb}\selectfont}
\DeclareRobustCommand\ltseries{\fontseries{l}\selectfont}
\DeclareRobustCommand\clseries{\fontseries{cl}\selectfont}
\DeclareRobustCommand\scseries{\fontseries{sc}\selectfont}
\DeclareTextFontCommand{\texteb}{\ebseries}
\DeclareTextFontCommand{\textsb}{\sbseries}
\DeclareTextFontCommand{\textlt}{\ltseries}
\DeclareTextFontCommand{\textcl}{\clseries}
\DeclareTextFontCommand{\textsc}{\scseries}

% -----------------------------------------------------------------------------
%                          DOCUMENT CLASS AND OPTIONS
% -----------------------------------------------------------------------------
% Sets the base class for the RadboudReport type to report (shocker, I know).
% The twocolumn option is disabled.
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[onecolumn, a4paper]{report}

% -----------------------------------------------------------------------------
%                               TABLE OF CONTENTS
% -----------------------------------------------------------------------------
% Styles the table of contents
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\fontsize{30}{30}\selectfont \color{berry} \ebseries}
\renewcommand{\cftchapfont}{\ebseries \color{berry}}% Chapter colour
\renewcommand{\cftdot}{\color{lightgray} .}

% -----------------------------------------------------------------------------
%                                   HEADINGS
% -----------------------------------------------------------------------------
\RequirePackage{titling}
\RequirePackage[raggedright]{titlesec}
\RequirePackage{ragged2e}

\titleformat{\chapter} % command
    [block] % shape: hang, block, display, runin, leftmargin, rightmargin, drop, wrap and frame.
    {\ebseries \color{berry} \singlespacing} % format
    {{\ltseries \fontsize{14}{14}\selectfont \color{mahogany} \chaptertitlename ~\thechapter}\\[0.1cm]} % label
    {0ex} % sep
    {\fontsize{30}{30}\selectfont \lsstyle \raggedright} % before-code
    [] % after-code

\titleformat{\section} % command
    [hang] % shape
    {\ebseries \color{berry} \singlespacing} % format
    {\fontsize{14}{18.66}\selectfont \thesection \hspace{1cm}} % label
    {0ex} % sep
    {\fontsize{14}{18.66}\selectfont \lsstyle \raggedright} % before-code
    [] % after-code
    
\titleformat{\subsection} % command
    [hang] % shape
    {\fontsize{14}{18.66}\selectfont \color{berry} \singlespacing} % format
    {\thesubsection \hspace{1cm}} % label
    {0ex} % sep
    {\fontsize{14}{18.66}\selectfont} % before-code
    [] % after-code

\titleformat{\subsubsection} % command
    [hang] % shape
    {\large \color{berry} \singlespacing} % format
    {\thesubsubsection \hspace{1cm}} % label
    {0ex} % sep
    {} % before-code
    [] % after-code

\titleformat{\paragraph} % command
    [runin] % shape
    {\ebseries \color{mahogany} \singlespacing} % format
    {\theparagraph \hspace{1cm}} % label
    {0ex} % sep
    {} % before-code
    [] % after-code

\titleformat{\subparagraph} % command
    [runin] % shape
    {\ebseries \itshape \color{mahogany} \singlespacing} % format
    {\thesubparagraph \hspace{1cm}} % label
    {0ex} % sep
    {} % before-code
    [] % after-code
    
% -----------------------------------------------------------------------------
%                                   TABLES
% -----------------------------------------------------------------------------
% Allows for coloring of table cells and rows. Also includes code to increase
% the padding in cells.
\RequirePackage{colortbl}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{makecell, cellspace, caption}
\setlength\cellspacetoplimit{3pt}
\setlength\cellspacebottomlimit{3pt}
\renewcommand{\arraystretch}{1.3}
% Defines commands to color table cells. Example usage can be found in the 
% example.tex document.
\newcommand\headerrow{\rowcolor{tableheader}}
\newcommand\headercell[1]{\bfseries \color{white} #1}
\newcommand\oddrow{\rowcolor{tablerowodd}}
\newcommand\evenrow{\rowcolor{tableroweven}}
\newcommand\footercell[1]{\bfseries #1}

% -----------------------------------------------------------------------------
%                                    MISC
% -----------------------------------------------------------------------------
\RequirePackage{setspace}
\RequirePackage[font={color=tableheader}, labelfont={it}, labelsep=quad]{caption}
\RequirePackage{graphicx}

% -----------------------------------------------------------------------------
%                           ITEMIZE AND ENUMERATE
% -----------------------------------------------------------------------------
% Colors the bullet points and numbers in lists
\renewcommand{\labelenumi}{\color{berry} \arabic{enumi}.}
\renewcommand{\labelenumii}{\color{berry} \arabic{enumi}.\arabic{enumii}.}
\renewcommand{\labelenumiii}{\color{berry} \arabic{enumi}.\arabic{enumii}.\arabic{enumiii}.}
\renewcommand{\labelenumiv}{\color{berry} \arabic{enumi}.\arabic{enumii}.\arabic{enumiii}.\arabic{enumiv}.}
\renewcommand*\labelitemi{\color{berry}\textbullet}
\renewcommand*\labelitemii{\color{berry}--}
\renewcommand*\labelitemiii{\color{berry}$\diamond$}
\renewcommand*\labelitemiv{\color{berry}\textperiodcentered}

% -----------------------------------------------------------------------------
%                        DOCUMENT-SPECIFIC COMMANDS
% -----------------------------------------------------------------------------
% Defines commands to add information to the cover page. These commands are:
%  - \supertitle{ ... }: Adds a text above the document title
%  - \subtitle{ ... }{ ... }: Adds a subtitle below the document title
%  - \addnameleft{ ... }: Adds a name and "subtitle" to the left column
%  - \addnameright{ ... }: Adds a name and "subtitle" to the right column
%  - \coverabstract{ ... }: Adds the provided text as asbtract to the cover
\newcommand{\authortag}[2]{{\fontseries{eb}\selectfont #1}\endgraf{\color{redimpact} #2}}%\\
\newcommand\thenamesleft{}
\newcommand{\addnameleft}[2]{%
    \g@addto@macro\thenamesleft{{\authortag{#1}{#2}\\[0.4cm]}}%
}
\newcommand\thenamesright{}
\newcommand{\addnameright}[2]{%
    \g@addto@macro\thenamesright{{\authortag{#1}{#2}\\[0.4cm]}}%
}
\newcommand\thesupertitle{}
\newcommand\supertitle[1]{
    \renewcommand{\thesupertitle}{#1}
}
\newcommand\thesubtitle{}
\newcommand\subtitle[1]{
    \renewcommand{\thesubtitle}{#1}
}
\newcommand\thecoverabstract{}
\newcommand\coverabstract[1]{
    \renewcommand{\thecoverabstract}{#1}
}

% -----------------------------------------------------------------------------
%                                   ABSTRACT
% -----------------------------------------------------------------------------
% Styles the abstract environment so that it fits (stylewise) on the cover
% page defined in the section below.
\renewenvironment{abstract}
    {\begin{minipage}{\textwidth}\noindent\ltseries\fontsize{10}{12.5}}
    {\end{minipage}\hfill}

% -----------------------------------------------------------------------------
%                                 PAGE NUMBERS
% -----------------------------------------------------------------------------
% Styles the page numbers, allowing for both twosided and onesided documents
\RequirePackage[includefoot, a4paper, margin=2.5cm, bottom=2cm, footskip=45pt]{geometry}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[O]{\hfill \color{berry} |\hspace{0.3cm}\thepage }
\fancyfoot[E]{\color{berry} \thepage\hspace{0.3cm}|\hfill }
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[O]{\hfill \color{berry} {\ltseries |}\hspace{0.3cm}\thepage }
    \fancyfoot[E]{\color{berry} \thepage\hspace{0.3cm}{\ltseries |}\hfill }
    \renewcommand{\headrulewidth}{0mm}
}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% -----------------------------------------------------------------------------
%                                 LINE SPACING
% -----------------------------------------------------------------------------
% Defines default line spacing (i.e. for bread text)
\renewcommand*\baselinestretch{1.333}\selectfont
