(TeX-add-style-hook
 "color-env"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("mdframed" "framemethod=TikZ")))
   (TeX-run-style-hooks
    "xcolor"
    "graphicx"
    "mdframed"
    "framed"
    "amsthm")
   (TeX-add-symbols
    "oldendproof")
   (LaTeX-add-labels
    "#2")
   (LaTeX-add-environments
    '("proposition" LaTeX-env-args ["argument"] 1)
    '("devlist" LaTeX-env-args ["argument"] 1)
    '("task" LaTeX-env-args ["argument"] 1)
    '("lemma" LaTeX-env-args ["argument"] 1)
    '("theorem" LaTeX-env-args ["argument"] 1)
    "problem")
   (LaTeX-add-counters
    "theo"
    "lem"
    "def"
    "cor"
    "prop")
   (LaTeX-add-xcolor-definecolors
    "DarkGreenBlue"
    "LightGreenBlue"
    "LightOrange"
    "DarkOrange"
    "RedOrange"
    "BrightRed"
    "DeepBlue"
    "shadecolor")
   (LaTeX-add-amsthm-newtheorems
    "prob"))
 :latex)

