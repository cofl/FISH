(defpackage fish)
(defvar fish::settings (make-hash-table))
(setf (gethash 'nyanmode fish::settings) nil)
(defun fish::main () (format t "FISH: Feline Interactive SHell~%>")
	(do ((i (read-line) (read-line)))
		((or
			(and (> (length i) 0) (equal (subseq (string-downcase i) 0 1) "q"))
			(if (equal (string-downcase (subseq i 0 4)) "rtfm") (not (format t "No. You."))))
		 (progn (setf (gethash 'nyanmode fish::settings) nil)))
		(cond
			((listp (read-from-string i)) (format t "~A~%>" (eval (read-from-string i))))
			((equal (string-downcase i) "-nyanmode") (progn
				(cond
					((gethash 'nyanmode fish::settings) (setf (gethash 'nyanmode fish::settings) nil))
					((not (gethash 'nyanmode fish::settings)) (setf (gethash 'nyanmode fish::settings) t)))
				(format t ">")))
			((equal (string-downcase i) "-about") (format t "FISH: Feline Interactive SHell~%Written by C. LaCourt.~%Not much else to say...~%>"))
			((equal (string-downcase (subseq i 0 4)) "rtfm") (format t "No, you.")) 
			((gethash 'nyanmode fish::settings) (let ((num (random 4))) (cond
				((equal num 0) (format t "Nyan!~%>"))
				((equal num 1) (format t "NYAN!~%>"))
				((equal num 2) (format t "NYANNYANNYAN!!!~%>"))
				((equal num 3) (format t "NyAnNyAnnYanNYannYAN!!!!!!!!~%>")))))
			(t (let ((num (random 4))) (cond
				((equal num 0) (format t "Meow.~%>"))
				((equal num 1) (format t "Meow?~%>"))
				((equal num 2) (format t "Meow!~%>"))
				((equal num 3) (format t "MEOW!~%>"))))))))