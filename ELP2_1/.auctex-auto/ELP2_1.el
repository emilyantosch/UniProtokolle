(TeX-add-style-hook
 "ELP2_1"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("babel" "ngerman") ("geometry" "includehead" "headheight=17mm" "footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "tmargin=0mm" "bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
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
    "babel"
    "geometry"
    "anyfontsize"
    "xcolor")
   (LaTeX-add-labels
    "fig:schalt1"
    "sec:ausgangskennlinie"
    "eq:1"
    "eq:2"
    "fig:ausgang"
    "eq:3"
    "eq:4"
    "sec:ubertr"
    "fig:uebertragungskennlinie"
    "sec:steuerkennlinie"
    "fig:steuer"
    "fig:schalt2"
    "sec:bestimmung-des-ein"))
 :latex)

