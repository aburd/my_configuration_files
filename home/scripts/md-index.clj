#!/usr/bin/env bb
(require '[clojure.string :as s])


(defn usage
  []
  (println "md-index.clj [target-markdown-file]"))


(let [[p] *command-line-args*]
  (when (or (nil? p) (not (s/ends-with? p ".md")))
    (usage)
    (System/exit 1))
  (let [content (slurp p)
        headings (->> content
                      (s/split-lines)
                      (filter #(s/starts-with? % "#"))
                      (map (fn [line]
                             (let [[hashes title] (s/split line #"\s")
                                   anchor-link (format "#%s" (s/replace (s/lower-case title) #"\s" "-"))
                                   tabs (apply str (repeat (dec (count hashes)) "  "))]
                               (format "%s- [%s](%s)" tabs title anchor-link)))))]
    (println (s/join "\n" headings))))
