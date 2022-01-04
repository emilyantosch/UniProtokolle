(TeX-add-style-hook
 "gep3"
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
    "fig:esbtrafo"
    "eq:1"
    "fig:leerlaufaufbau"
    "sec:messung-i_10"
    "sec:konklusion"))
 :latex)

