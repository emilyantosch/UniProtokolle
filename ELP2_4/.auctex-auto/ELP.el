(TeX-add-style-hook
 "ELP"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("geometry" "includehead" "headheight=17mm" "footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "tmargin=0mm" "bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "circuitikz"
    "fontenc"
    "inputenc"
    "amsmath"
    "amssymb"
    "fancyhdr"
    "graphicx"
    "hyperref"
    "subcaption"
    "tikz"
    "cite"
    "tocbibind"
    "babel"
    "geometry"
    "anyfontsize"
    "xcolor")
   (LaTeX-add-labels
    "sec:einleitung"
    "sec:inbetriebnahme"
    "fig:schalt1"
    "sec:vorbereitung"
    "eq:1"
    "sec:duchfuhrung"
    "fig:osziinbetrieb"
    "sec:auswertung"
    "sec:ubertr-ua=f-ubern"
    "sec:vorbereitung-1"
    "sec:duchfuhrung-1"
    "fig:schaltAlissa"
    "fig:schaltBlissa"
    "sec:auswertung-1"
    "sec:aufg-leist-ausg"
    "sec:vorbereitung-2"
    "fig:erwartung"
    "sec:durchfuhrung"
    "tab:messungauf3"
    "fig:powerplot"
    "fig:eff"
    "sec:auswertung-2")
   (LaTeX-add-bibliographies
    "ELP2_1")
   (LaTeX-add-xcolor-definecolors
    "DarkGreenBlue"
    "LightGreenBlue"
    "LightOrange"
    "DarkOrange"
    "RedOrange"
    "BrightRed"
    "DeepBlue"))
 :latex)

