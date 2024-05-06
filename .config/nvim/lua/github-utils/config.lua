-- [nfnl] Compiled from fnl/github-utils/config.fnl by https://github.com/Olical/nfnl, do not edit.
local nfnl = require("nfnl.core")
local _local_1_ = require("nfnl.string")
local split = _local_1_["split"]
local trim = _local_1_["trim"]
local join = _local_1_["join"]
local notify = require("notify")
local nio = require("nio")
local config_path = nfnl.str(vim.fn.expand("$HOME"), "/.config/github-utils.conf")
local function is_config_set_3f()
  return not nfnl["nil?"](nfnl.slurp(config_path))
end
local function parse_config(config_s)
  local lines = split(trim(config_s), "\n")
  local function _2_(acc, line)
    local _let_3_ = split(line, "=")
    local k = _let_3_[1]
    local v = _let_3_[2]
    if (nfnl["nil?"](k) or nfnl["nil?"](v)) then
      return error("invalid config")
    else
      return nfnl.assoc(acc, trim(k), v)
    end
  end
  return nfnl.reduce(_2_, {}, lines)
end
local function get_config_from_disk()
  if is_config_set_3f() then
    return parse_config(nfnl.slurp(config_path))
  else
    return nil
  end
end
local function config__3estr(config)
  local function _6_(pair)
    return join("=", pair)
  end
  return join("\n", nfnl.map(_6_, nfnl["kv-pairs"](config)))
end
local function set_config(config)
  return nfnl.spit(config_path, config__3estr(config))
end
local function input_yes_3f(input)
  if ((input == "yes") or (input == "y")) then
    return true
  else
    return false
  end
end
local function set_github_token_prompt()
  return nio.ui.input({prompt = "Please input your github access token. If you do not know it, you can always edit your configuration later: "})
end
local function set_config_prompt()
  return nio.ui.input({prompt = "You do not have any configuration for github-utils. Would you like to create one? y/n "})
end
local function user_config_setup_process()
  if input_yes_3f(set_config_prompt()) then
    local token = set_github_token_prompt()
    local config = {token = token}
    set_config(config)
    notify(nfnl.str("Configuration has been written to ", config_path))
    return config
  else
    return nil
  end
end
local function get_config()
  return (get_config_from_disk() or user_config_setup_process())
end
return {["get-config"] = get_config}
