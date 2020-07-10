(require 'org-ref)
(setq org-latex-default-packages-alist nil)
(setq org-latex-caption-above nil)
(princ (format "org-version: %s\n" (org-version)))
(org-ref-version)

;; Koma-script report
(add-to-list 'org-latex-classes
          '("scrreprt" "\\documentclass[11pt]{scrreprt}"
            ("\\part{%s}" . "\\part*{%s}")
            ("\\chapter{%s}" . "\\chapter*{%s}")
            ("\\section{%s}" . "\\section*{%s}")
            ("\\subsection{%s}" . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

;; Koma-script article
(add-to-list 'org-latex-classes
             '("scrartcl" "\\documentclass[11pt]{scrartcl}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
