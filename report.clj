#!/usr/bin/env bb

(require '[clojure.string :as string])

(def weekday-english ["Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"])
;; (defn parse-date [date-string]
;;   (get weekday-english
;;        (.getDay (.parse (java.text.SimpleDateFormat. "yyyy-MM-dd hh:mm") date-string))))

(defn parse-date [date-string]
  (.getDay (.parse (java.text.SimpleDateFormat. "yyyy-MM-dd hh:mm") date-string)))

;; (defn get-weekday [inst]
;;   (.getDisplayName (.getCalendar inst) java.util.Calendar/DAY_OF_WEEK java.util.Locale/ENGLISH))
;; (println (get-weekday (parse-date "2023-01-04 10:28")))
;=> "Wednesday"

(def contents (slurp "input.txt"))

(defn- ignore-timestamp [line]
  (subs line 17))
(defn parse-timestamp [line]
  (subs line 0 10))

(defn parse-hour [line]
  (subs line 11 13))

(defn- pickup-datetime-str [line]
  (subs line 0 17))

(defn- parse-commands [line]
  (let [rest (ignore-timestamp line)]
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
     (map ignore-timestamp)
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

;; the busiest day
(->> commands
     (map parse-timestamp)
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

;; Weekly Activity
(->> commands
     (map pickup-datetime-str)
     (map parse-date)
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by first)
     (def weekly-usage))

(println "📅Weekly Activity")
(doseq [[value, count] weekly-usage]
  (println (format "%8s %s" value (string/join (repeat (/ count 100) "█")))))
(println)

;; Daily Activity
(->> commands
     (map parse-hour)
     (group-by identity)
     (map (fn [[k v]] [k (count v)]))
     (sort-by first)
     (def hourly-usage))

(println "🕙Daily Activity")
(doseq [[value, count] hourly-usage]
  (println (format "%5s:00 %s" value (string/join (repeat (/ count 100) "█")))))
(println)