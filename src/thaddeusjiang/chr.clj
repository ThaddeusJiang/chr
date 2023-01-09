#!/usr/bin/env bb

(ns thaddeusjiang.chr
  (:require [clojure.string :as string]))

(def home-dir (System/getenv "HOME"))
(def shell-prefix (last (string/split (System/getenv "SHELL") #"/")))

(def contents (slurp (format "%s/.%s_history" home-dir shell-prefix)))

(->> contents
     (string/split-lines)
     (filter #(string/starts-with? % ":"))
     (def commands))

(defn parse-date [date-string]
  (->> date-string
       (format "%s000")
       (parse-long)
       (java.util.Date.)))

(defn- ignore-timestamp-str [line]
  (subs line 15))

(defn- parse-commands [line]
  (some-> line
          not-empty
          (string/split #";")
          second
          (string/split #"\s+")
          first))

(defn- get-directory [line]
  (second (string/split line #"\s+")))

(defn -main [& _]
;; total number of commands
  (->> commands
       (count)
       (def total))
  (println (format "Total: %d" total))
  (println)

  (->> commands
       (keep parse-commands)
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

  (defn- pickup-datetime-str [line]
    (subs line 2 12))

;; the busiest day
  (->> commands
       (map pickup-datetime-str)
       (map parse-date)
       (map (fn [date] (format "%tF" date)))
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

  (defn weekday [date-string]
    (.getDay (parse-date date-string)))

;; Weekly Activity
  (->> commands
       (map pickup-datetime-str)
       (map weekday)
       (group-by identity)
       (map (fn [[k v]] [k (count v)]))
       (sort-by first)
       (map (fn [[k v]] [(translate-weekday k) v]))
       (def weekly-usage))

  (println "📅Weekly Activity")
  (doseq [[value, count] weekly-usage]
    (println (format "%10s %s" value (string/join (repeat (/ count 100) "█")))))
  (println)

;; Daily Activity
  (->> commands
       (map pickup-datetime-str)
       (map parse-date)
       (map (fn [date] (format "%tH" date)))
       (group-by identity)
       (map (fn [[k v]] [k (count v)]))
       (sort-by first)
       (def hourly-usage))

  (println "🕙Daily Activity")
  (doseq [[value, count] hourly-usage]
    (println (format "%6s:00 %s" value (string/join (repeat (/ count 100) "█")))))
  (println))