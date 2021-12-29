(TeX-add-style-hook
 "rtp"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("fncychap" "Glenn") ("geometry" "includehead" "headheight=17mm" "footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "tmargin=0mm" "bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (TeX-run-style-hooks
    "latex2e"
    "../assets/scripts/tex/structure"
    "report"
    "rep10"
    "fontenc"
    "inputenc"
    "amsmath"
    "enumerate"
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
    "trfsigns"
    "geometry"
    "anyfontsize"
    "xcolor")
   (LaTeX-add-labels
    "eq:endwert"
    "eq:1"
    "eq:3"
    "eq:2"
    "eq:4"
    "tab:lead"))
 :latex)

