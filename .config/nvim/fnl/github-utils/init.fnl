(local {: get-config} (require :github-utils.config))
(local github (require :github-utils.github))
(local nio (require :nio))
(local {: split} (require :nfnl.string))

(fn paste-github-file-into-buf 
  [owner repo path ref]
  (nio.run
      (fn []
        (let [config (get-config)
              {: stdout} (github.get-content 
                           config
                           owner
                           repo
                           path
                           {: ref})]
          (vim.schedule
            (fn []
              (vim.api.nvim_put (split stdout "\n") "" false true)))))))

(vim.api.nvim_create_user_command 
  "GithubUtilsPaste" 
  (fn [{: fargs}] 
    (let [[owner repo path ref] fargs]
      (paste-github-file-into-buf owner repo path ref)))
  {:nargs "*"})

{: paste-github-file-into-buf}
