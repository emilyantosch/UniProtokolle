(TeX-add-style-hook
 "DIHA"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("geometry" "includehead" "headheight=17mm" "footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "tmargin=0mm" "bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
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
    "listings"
    "geometry"
    "anyfontsize"
    "xcolor")
   (TeX-add-symbols
    '("invisiblesection" 1))
   (LaTeX-add-labels
    "cha:teil-plausibilitat"
    "sec:einleitung"
    "sec:blockschaltbild"
    "fig:blockA"
    "sec:losungsidee"
    "sec:beschreibung-vhdl"
    "sec:simul-der-ergebn"
    "sec:fazit"
    "cha:berechn-der-regel"
    "sec:einleitung-1"
    "sec:blockschaltbild-1"
    "fig:blockregel"
    "sec:automatengraph"
    "sec:losungsidee-1"
    "sec:carry-look-addi"
    "sec:zweier-komplement"
    "sec:taktsynchronitat"
    "sec:beschreibung-vhdl-1"
    "sec:simul-der-ergebn-1"
    "sec:fazit-1")
   (LaTeX-add-xcolor-definecolors
    "DarkGreenBlue"
    "LightGreenBlue"
    "LightOrange"
    "DarkOrange"
    "RedOrange"
    "BrightRed"
    "DeepBlue"))
 :latex)

