(TeX-add-style-hook
 "gep3"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("geometry" "includehead" "headheight=17mm" "footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "tmargin=0mm" "bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
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
    "tab:fifp"
    "sec:best-des-spann"
    "eq:2"
    "sec:stromv-im-nennp"
    "fig:vollnennstrom"
    "fig:halbnennstrom"
    "sec:einsch-der-prim"
    "sec:kurzschlussversuch"
    "sec:mess-der-kurzschl"
    "tab:messkurz"
    "fig:31_242"
    "sec:belastungsversuch"
    "tab:messbelast"
    "sec:mess-der-sekund"
    "sec:auswertung"
    "sec:best-der-ersatz"
    "sec:best-der-ersatz-1"
    "sec:ermittl-des-wirk"
    "sec:konklusion")
   (LaTeX-add-listings-lstdefinestyles
    "code")
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
    "backcolour"))
 :latex)

