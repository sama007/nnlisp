(load "/home/sam/code/ext/nnlisp/nnlisp.el")

(ert-deftest test-nnlisp/dotproduct ()
  (should (= (nnlisp/dotproduct [1 2 3] [4 5 6]) 32)))
