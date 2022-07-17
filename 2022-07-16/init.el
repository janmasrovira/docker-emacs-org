(require 'org-ref)
(setq org-latex-default-packages-alist nil)
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

(add-to-list 'org-latex-classes
             '("letter"
               "\\documentclass{letter}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
             '("scrletter"
               "\\documentclass{scrletter}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
             '("scrlttr2"
               "\\documentclass{scrlttr2}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(setq org-confirm-babel-evaluate nil)
(defun load-init-block ()
  (setq block-name "init")
  (if (org-babel-find-named-block block-name)
      (progn
        (org-babel-goto-named-src-block block-name)
        (org-babel-execute-src-block)
        (princ (format "%s block loaded\n" block-name))
        )
    (princ (format "%s block not found\n" block-name))
    ))
