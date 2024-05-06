(local nfnl (require :nfnl.core))
(local {: create-url} (require :github-utils.url))
(local nio (require :nio))

(local github-url "https://api.github.com")

(fn gh-curl-args-common [opts]
  (let [{: token} (or opts {})]
    (nfnl.concat
      ["-H" "Accept: application/vnd.github.raw+json"
       "-H" "X-GitHub-Api-Version: 2022-11-28"]
      (if token
          ["-H" (nfnl.str "Authorization: Bearer " token)]
          []))))
 
(fn gh-curl-args-get [url opts]
  "create curl cmd args for a get request to github api
  @return wrapped nio fn"
  (nfnl.concat
    [:curl
     "--url" url
     "--request" "GET"] 
    (gh-curl-args-common opts)))
                                    

(local 
  get-content
  (nio.wrap 
    (fn 
     [conf owner repo path opts cb]
     "fn optionally takes opts 
      - cb - callback, (text: str) -> void
      - ref for github ref e.g. master
      @return nio.process - stdout is curl result"
     (let [url (create-url github-url [:repos owner repo :contents path] opts)
           args (gh-curl-args-get url conf)]
       (vim.system args {:text true} cb)))
    6))

{: get-content}
