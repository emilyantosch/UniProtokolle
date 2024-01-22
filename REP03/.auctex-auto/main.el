(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("fncychap" "Glenn") ("geometry" "	includehead" "	headheight=17mm" "	footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "	tmargin=0mm" "	bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
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
    "geometry"
    "anyfontsize"
    "float"
    "xcolor")
   (LaTeX-add-labels
    "fig:zahl_moment"
    "fig:zahl_leistung"
    "fig:aufbau_direkt"
    "tab:direkt_pel"
    "fig:oszi_direkt_spannung"
    "fig:oszi_direkt_dynamisch"
    "fig:aufbau_umrichter"
    "sec:windkr-mit-dopp"
    "sec:auswertung"
    "fig:auswertung_pel"
    "fig:auswertung_eta"
    "fig:auswertung_leistung"
    "sec:fazit")
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

