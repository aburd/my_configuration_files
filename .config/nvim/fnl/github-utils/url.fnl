(local nfnl (require :nfnl.core))
(local {: join} (require :nfnl.string))

(fn create-query-s [kvs]
  "create params string from key-value pairs
   {:foo :bar} -> foo=bar"
  (->> (nfnl.kv-pairs kvs)
       (nfnl.map (fn [pair] (join := pair)))
       (join :&)))

(fn create-url [domain path-parts-or-path query]
  "will attempt to create a url
  @domain {string}
  @param {string|string[]} path-parts-or-path - if string then path, if array of string, joined together with /
  @param {table<string, string>?}"
  (let [path (if (nfnl.string? path-parts-or-path)
                 path-parts-or-path
                 (join :/ path-parts-or-path)) 
        maybe-query-s (if query (create-query-s query) nil)]
    (nfnl.str domain 
              :/ 
              path 
              (if maybe-query-s 
                  (nfnl.str "?" maybe-query-s)
                  ""))))

{: create-url}
