#!/usr/bin/env bb

(def contents (slurp "history.txt"))

(defn parse-line [line]
  (let [rest (subs line 7)]
    (first (clojure.string/split rest #"\s+"))))


(def commands (map parse-line (clojure.string/split contents #"\n")))
(def data (group-by identity commands))
;; get data count
(def data-count (map (fn [[k v]] [k (count v)]) data))
;; sort by count desc
(def data-count (sort-by second data-count))
;; get top 10
(def data-count (take 10 (reverse data-count)))
;; print
(println "--top 10 commands--\n")
(doseq [[k v] data-count]
  (println k v))
(println "\n--total--" (count commands))