(ns my-test
  (:require [clojure.test :refer [deftest is testing]]))

(deftest my-first-test
  (testing "equality works"
    (is (= 1 1))))

(deftest my-second-test
  (testing "equality still works"
    (is (= 2 2))))