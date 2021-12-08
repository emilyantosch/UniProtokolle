(TeX-add-style-hook
 "GEP"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("geometry" "includehead" "headheight=17mm" "footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "tmargin=0mm" "bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "circuitikz"
    "fontenc"
    "inputenc"
    "subcaption"
    "amsmath"
    "fancyhdr"
    "lettrine"
    "hyperref"
    "tikz"
    "cite"
    "listings"
    "tocbibind"
    "babel"
    "geometry"
    "anyfontsize"
    "xcolor")
   (LaTeX-add-labels
    "fig:b6"
    "eq:1"
    "eq:2"
    "fig:startAngle"
    "tab:mess1"
    "fig:31_242"
    "tab:mess2"))
 :latex)

