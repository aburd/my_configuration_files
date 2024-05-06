(local nfnl (require :nfnl.core))
(local {: split : trim : join} (require :nfnl.string))
(local notify (require :notify))
(local nio (require :nio))

(local config-path (nfnl.str (vim.fn.expand "$HOME") "/.config/github-utils.conf"))

(fn is-config-set? []
  (not (nfnl.nil? (nfnl.slurp config-path))))

(fn parse-config 
  [config-s]
  "config will be a flat k=v style config file
  whitespace is always trimmed from keys
  returns a table with all ks and vs"
  (let [lines (split (trim config-s) "\n")]
    (nfnl.reduce
      (fn [acc line]
        (let [[k v] (split line "=")]
          (if (or (nfnl.nil? k) (nfnl.nil? v))
              (error "invalid config")
              (nfnl.assoc acc (trim k) v))))
      {}
      lines)))

(fn get-config-from-disk []
  (if (is-config-set?)
      (parse-config (nfnl.slurp config-path))
      nil))

(fn config->str [config]
  "config should be a table, will write the config to config-path"
  (->> (nfnl.kv-pairs config)
       (nfnl.map (fn [pair] (join "=" pair)))
       (join "\n")))

(fn set-config [config]
  (nfnl.spit config-path (config->str config)))

(fn input-yes? [input]
  (if (or (= input "yes") (= input "y"))
      true
      false))

(fn set-github-token-prompt []
  (nio.ui.input 
    {:prompt "Please input your github access token. If you do not know it, you can always edit your configuration later: "})) 

(fn set-config-prompt []
  (nio.ui.input 
    {:prompt "You do not have any configuration for github-utils. Would you like to create one? y/n "})) 

(fn user-config-setup-process []
  (if (-> (set-config-prompt)
          (input-yes?))
      (let [token (set-github-token-prompt)
            config {: token}]
        (set-config config)
        (notify (nfnl.str "Configuration has been written to " config-path))
        config)))

(fn get-config []
  "will attempt to get config from disk
   will prompt user to set if it is not found on disk

   returns async Config"
  (or (get-config-from-disk)
      (user-config-setup-process)))

{: get-config}
