(require 'nnlisp)

(ert-deftest test-nnlisp/dotproduct ()
  (should (= (nnlisp/dotproduct [1 2 3] [4 5 6]) 32)))
