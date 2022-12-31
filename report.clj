#!/usr/bin/env bb

(require '[clojure.string :as string])
(def contents (slurp "history.txt"))

(defn- parse-line [line]
  (let [rest (subs line 7)]
    (first (string/split rest #"\s+"))))

(def commands (string/split-lines contents))

(->> commands
     (count)
     (def total))

(->> commands
     (map parse-line)
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by second)
     (reverse)
     (take 10)
     (def top-commands))

;; top 10 directories

(defn- ignore-number [line]
  (subs line 7))

(defn- get-directory [line]
  (second (string/split line #"\s+")))

(->> commands
     (map ignore-number)
     (filter #(string/starts-with? % "cd"))
     (map get-directory)
     (filter #(not (string/blank? %)))
     (filter #(not (string/starts-with? % "..")))
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by second)
     (reverse)
     (take 10)
     (def top-directories))

;; print total
(println (format "Total: %d" total))
(println)

;; ;; print top 10 commands
(println "🏆Top 10 commands")
(doseq [[value count] top-commands]
  (println (format "%6d %s" count value)))
(println)

;; print top 10 directories
(println "📂Top 10 directories")
(doseq [[value, count] top-directories]
  (println (format "%6d %s" count value)))
(println)