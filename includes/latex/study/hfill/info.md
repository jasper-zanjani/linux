`\hfill` acts as a "rubber length" that consumes all avialable horizontal space between two objects.
This will allow multiple items to be placed on a single line, for example job title on the left and date range on the right.

```latex
% \newcommand{\name}[number_of_args]{definition}
\newcommand{\resumeHeaderLine}[2]{%
  \noindent                % Prevent accidental indentation
  {\ralewayfont\Large #1}  % First argument (e.g., Job Title)
  \hfill                   % Push everything after this to the right
  {\ralewayfont\large #2}  % Second argument (e.g., Dates)
  \par                     % End the block correctly
  \vspace{2pt}             % Optional: fine-tune the gap to the next line
}
```
