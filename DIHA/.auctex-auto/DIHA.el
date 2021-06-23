(TeX-add-style-hook
 "DIHA"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("geometry" "includehead" "headheight=17mm" "footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "tmargin=0mm" "bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (TeX-run-style-hooks
    "latex2e"
    "report"
    "rep10"
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
   (TeX-add-symbols
    '("invisiblesection" 1))
   (LaTeX-add-labels
    "cha:teil-plausibilitat"
    "sec:aufgabe"
    "sec:blockschaltbild"
    "sec:losungsidee"
    "sec:beschreibung-vhdl"
    "sec:simul-der-ergebn"
    "sec:fazit"
    "cha:berechn-der-regel"))
 :latex)

