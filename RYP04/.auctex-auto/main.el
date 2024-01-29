(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("fncychap" "Sonny") ("geometry" "	includehead" "	headheight=17mm" "	footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "	tmargin=0mm" "	bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "report"
    "rep10"
    "fontenc"
    "inputenc"
    "amsmath"
    "enumerate"
    "trfsigns"
    "graphicx"
    "fancyhdr"
    "lettrine"
    "hyperref"
    "subcaption"
    "tikz"
    "cite"
    "listings"
    "tocbibind"
    "babel"
    "fncychap"
    "parskip"
    "microtype"
    "gensymb"
    "geometry"
    "anyfontsize"
    "float"
    "xcolor")
   (LaTeX-add-labels
    "sec:diskr-von-i"
    "sec:koeffizienten-fur-i"
    "eq:1"
    "eq:2"
    "tab:koeIPI"
    "sec:simul-der-digit"
    "fig:sim-i-pi"
    "fig:M3.1.png"
    "fig:M3.2.png"
    "fig:M3.3.png"
    "fig:M3.4.png"
    "fig:M3.5.png"
    "fig:m36iregler"
    "fig:m36piregler"
    "fig:M3.7 I-Regler png"
    "fig:M3.7 PI-Regler png"
    "fig:M3.5 mit daten Punkten png")
   (LaTeX-add-xcolor-definecolors
    "DarkGreenBlue"
    "LightGreenBlue"
    "LightOrange"
    "DarkOrange"
    "RedOrange"
    "BrightRed"
    "DeepBlue"
    "codegreen"
    "codegray"
    "codepurple"
    "backcolour")
   (LaTeX-add-listings-lstdefinestyles
    "code"))
 :latex)

