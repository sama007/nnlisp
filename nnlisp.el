;;; nnlisp.el --- Neural Network in ELisp -*- lexical-binding: t -*-

(require 'cl-lib)

(defun nnlisp/_validatevectorsfordotp (a b)
  (and (vectorp a) (vectorp b) (eq (length a) (length b)))
  )

(defun nnlisp/dotproduct (a b)
  (if (nnlisp/_validatevectorsfordotp a b)
      (seq-reduce #'+ (seq-mapn #'* a b) 0)
    (error (format "Vector validations failed for dot product"))))

(defun nnlisp/transpose (a)
  (let* ((row (length a))
	 (col (length (elt a 0))))
	 (vconcat (seq-partition
		       (cl-loop for j from 0 to (- (length (elt a 0)) 1) vconcat
				(cl-loop for i from 0 to  (- (length a) 1) vconcat
					 (vector (elt (elt a i) j))))
		       row))
    ;;(list ta col row)
    )
  )

(defun nnlisp/matmul (a b)
  (let* (
	 (row1 (length a))
	 (col1 (length (elt a 0)))
	 (row2 (length b))
	 (col2 (length (elt b 0)))
	 (mat2t (nnlisp/transpose b))
	 )
    (if (eq col1 row2)
	(vconcat (cl-loop for i from 0 to (- row1 1) collect
		 (cl-loop for j from 0 to (- col2 1) vconcat
			  (vector (nnlisp/dotproduct (elt a i) (elt mat2t j))))))
      (error (format "Dimension mismatch in matrix multiplication.")))))

;; (nnlisp/dotproduct [1 2] [3 4])
;; (nnlisp/transpose [[1 2] [3 4] [7 8]])
;;

;; (let (
;;       (a [[1 2] [3 4]])
;;       (b [[5 6] [7  8]])
;;       )
;;   (nnlisp/matmul a b)
;;   )
;; (nnlisp/matmul [[1 2 3] [4 5 6] [9 8 6]]  [[1] [2] [3]])

(provide 'nnlisp)
