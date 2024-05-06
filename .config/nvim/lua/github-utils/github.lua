-- [nfnl] Compiled from fnl/github-utils/github.fnl by https://github.com/Olical/nfnl, do not edit.
local nfnl = require("nfnl.core")
local _local_1_ = require("github-utils.url")
local create_url = _local_1_["create-url"]
local nio = require("nio")
local github_url = "https://api.github.com"
local function gh_curl_args_common(opts)
  local _let_2_ = (opts or {})
  local token = _let_2_["token"]
  local function _3_()
    if token then
      return {"-H", nfnl.str("Authorization: Bearer ", token)}
    else
      return {}
    end
  end
  return nfnl.concat({"-H", "Accept: application/vnd.github.raw+json", "-H", "X-GitHub-Api-Version: 2022-11-28"}, _3_())
end
local function gh_curl_args_get(url, opts)
  return nfnl.concat({"curl", "--url", url, "--request", "GET"}, gh_curl_args_common(opts))
end
local get_content
local function _4_(conf, owner, repo, path, opts, cb)
  local url = create_url(github_url, {"repos", owner, repo, "contents", path}, opts)
  local args = gh_curl_args_get(url, conf)
  return vim.system(args, {text = true}, cb)
end
get_content = nio.wrap(_4_, 6)
return {["get-content"] = get_content}
