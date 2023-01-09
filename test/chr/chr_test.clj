(ns chr.chr-test
  (:require [chr.chr :as chr]
            [clojure.test :refer [deftest is testing]]))

(deftest parse-date-test
  (testing "parse date"
    (is (= (chr/parse-date "1672901786") (java.util.Date. 1672901786000)))))