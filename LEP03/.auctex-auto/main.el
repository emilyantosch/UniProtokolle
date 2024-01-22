(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("tocbibind" "nottoc" "numbib") ("babel" "ngerman") ("fncychap" "Glenn") ("geometry" "	includehead" "	headheight=17mm" "	footskip=\\dimexpr\\headsep+\\ht\\strutbox\\relax" "	tmargin=0mm" "	bmargin=\\dimexpr17mm+2\\ht\\strutbox\\relax" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
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
    "fig:leerlauf_aufbau"
    "tab:leerlaufversuch"
    "fig:kurzschluss_aufbau"
    "tab:kurzschlussversuch"
    "sec:polradspannung"
    "sec:kennlinien"
    "fig:leerlaufkennlinie"
    "fig:kurzschlusskennlinie"
    "eq:1"
    "eq:2"
    "eq:3"
    "sec:inselbetrieb"
    "sec:ohmsche-verbraucher"
    "fig:insel_ohmaufbau"
    "tab:ohm_messreihe_1"
    "tab:ohm_messreihe_2"
    "fig:inselbetrieb_ohm_oszi"
    "eq:4"
    "eq:5"
    "eq:6"
    "sec:induktive-last"
    "fig:insel_indukaufbau"
    "tab:induk_messreihe_1"
    "tab:induk_messreihe_2"
    "fig:insel_reininduk_oszi"
    "eq:7"
    "eq:8"
    "sec:synchr-mit-dem"
    "sec:synchr-auf-das"
    "fig:dunkelschaltung_aufbau"
    "sec:generatorbetrieb"
    "fig:sngn"
    "fig:smgn"
    "fig:sngue"
    "fig:smgue"
    "fig:sngu"
    "fig:smgu"
    "sec:motorbetrieb"
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

