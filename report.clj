#!/usr/bin/env bb

(require '[clojure.string :as string])

;; read input file
(def contents (slurp "input.txt"))

(defn- ignore-timestamp-str [line]
  (subs line 17))

(defn- parse-commands [line]
  (let [rest (ignore-timestamp-str line)]
    (first (string/split rest #"\s+"))))

(defn- get-directory [line]
  (second (string/split line #"\s+")))

(->> contents
     (string/split-lines)
     (def commands))

;; total number of commands
(->> commands
     (count)
     (def total))
(println (format "Total: %d" total))
(println)

(->> commands
     (map parse-commands)
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by second)
     (reverse)
     (take 10)
     (def top-commands))

(println "🏆Top 10 commands")
(doseq [[value count] top-commands]
  (println (format "%6d %s" count value)))
(println)

;; top 10 directories
(->> commands
     (map ignore-timestamp-str)
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

(println "📂Top 10 directories")
(doseq [[value, count] top-directories]
  (println (format "%6d %s" count value)))
(println)

(defn pickup-date-str [line]
  (subs line 0 10))

;; the busiest day
(->> commands
     (map pickup-date-str)
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by second)
     (reverse)
     (take 1)
     (def busiest-day))

(println "💦The busiest day")
(doseq [[value, count] busiest-day]
  (println (format "%6d commands on %s" count value)))
(println)

(def weekday-english ["Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"])
(defn translate-weekday [index]
  (get weekday-english index))

(defn- pickup-datetime-str [line]
  (subs line 0 17))

(defn parse-date [date-string]
  (.getDay (.parse (java.text.SimpleDateFormat. "yyyy-MM-dd hh:mm") date-string)))

;; Weekly Activity
(->> commands
     (map pickup-datetime-str)
     (map parse-date)
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by first)
     (map (fn [[k v]] [(translate-weekday k) v]))
     (def weekly-usage))

(println "📅Weekly Activity")
(doseq [[value, count] weekly-usage]
  (println (format "%10s %s" value (string/join (repeat (/ count 100) "█")))))
(println)

(defn pickup-hour [line]
  (subs line 11 13))
;; Daily Activity
(->> commands
     (map pickup-hour)
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by first)
     (def hourly-usage))

(println "🕙Daily Activity")
(doseq [[value, count] hourly-usage]
  (println (format "%6s:00 %s" value (string/join (repeat (/ count 100) "█")))))
(println)