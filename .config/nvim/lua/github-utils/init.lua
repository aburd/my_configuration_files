-- [nfnl] Compiled from fnl/github-utils/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("github-utils.config")
local get_config = _local_1_["get-config"]
local github = require("github-utils.github")
local nio = require("nio")
local _local_2_ = require("nfnl.string")
local split = _local_2_["split"]
local function paste_github_file_into_buf(owner, repo, path, ref)
  local function _3_()
    local config = get_config()
    local _let_4_ = github["get-content"](config, owner, repo, path, {ref = ref})
    local stdout = _let_4_["stdout"]
    local function _5_()
      return vim.api.nvim_put(split(stdout, "\n"), "", false, true)
    end
    return vim.schedule(_5_)
  end
  return nio.run(_3_)
end
local function _8_(_6_)
  local _arg_7_ = _6_
  local fargs = _arg_7_["fargs"]
  local _let_9_ = fargs
  local owner = _let_9_[1]
  local repo = _let_9_[2]
  local path = _let_9_[3]
  local ref = _let_9_[4]
  return paste_github_file_into_buf(owner, repo, path, ref)
end
vim.api.nvim_create_user_command("GithubUtilsPaste", _8_, {nargs = "*"})
return {["paste-github-file-into-buf"] = paste_github_file_into_buf}
