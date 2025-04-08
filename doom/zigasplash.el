;;; zigasplash.el --- Custom ASCII splash with random quote
(defun ziga/random-quote ()
  (let ((quotes '(
                  ""Simplicity is the soul of efficiency." – Austin Freeman"
                  ""Code is like humor. When you have to explain it, it's bad." – Cory House"
                  ""In the middle of difficulty lies opportunity." – Albert Einstein"
                  ""It always seems impossible until it's done." – Nelson Mandela"
                  ""Happiness is when what you think, what you say, and what you do are in harmony." – Gandhi"
                  )))
    (nth (random (length quotes)) quotes)))

;; Return the banner as a string instead of inserting it
(defun get-zigasplash ()
  (concat "
▒███████▒ ██▓  ▄████  ▄▄▄       ███▄ ▄███▓▓█████  ███▄    █  ██▓
▒ ▒ ▒ ▄▀░▓██▒ ██▒ ▀█▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀  ██ ▀█   █ ▓██▒
░ ▒ ▄▀▒░ ▒██▒▒██░▄▄▄░▒██  ▀█▄  ▓██    ▓██░▒███   ▓██  ▀█ ██▒▒██▒
  ▄▀▒   ░░██░░▓█  ██▓░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄ ▓██▒  ▐▌██▒░██░
▒███████▒░██░░▒▓███▀▒ ▓█   ▓██▒▒██▒   ░██▒░▒████▒▒██░   ▓██░░██░
░▒▒ ▓░▒░▒░▓   ░▒   ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░░ ▒░   ▒ ▒ ░▓
░░▒ ▒ ░ ▒ ▒ ░  ░   ░   ▒   ▒▒ ░░  ░      ░ ░ ░  ░░ ░░   ░ ▒░ ▒ ░
░ ░ ░ ░ ░ ▒ ░░ ░   ░   ░   ▒   ░      ░      ░      ░   ░ ░  ▒ ░
  ░ ░     ░        ░       ░  ░       ░      ░  ░         ░  ░
░
" "\n\n" (ziga/random-quote)))

;; Return this function when the file is loaded
(provide 'get-zigasplash)
