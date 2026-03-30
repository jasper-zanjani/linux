\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
\LoadClass{article}
\RequirePackage{fontspec}

% Raleway font
\newfontfamily\ralewayfont{Raleway}

% Custom macro
\newcommand{\resumesection}[1]{{\noindent\ralewayfont\Large\bfseries #1 \par}}
