-- [nfnl] Compiled from fnl/github-utils/url.fnl by https://github.com/Olical/nfnl, do not edit.
local nfnl = require("nfnl.core")
local _local_1_ = require("nfnl.string")
local join = _local_1_["join"]
local function create_query_s(kvs)
  local function _2_(pair)
    return join("=", pair)
  end
  return join("&", nfnl.map(_2_, nfnl["kv-pairs"](kvs)))
end
local function create_url(domain, path_parts_or_path, query)
  local path
  if nfnl["string?"](path_parts_or_path) then
    path = path_parts_or_path
  else
    path = join("/", path_parts_or_path)
  end
  local maybe_query_s
  if query then
    maybe_query_s = create_query_s(query)
  else
    maybe_query_s = nil
  end
  local function _5_()
    if maybe_query_s then
      return nfnl.str("?", maybe_query_s)
    else
      return ""
    end
  end
  return nfnl.str(domain, "/", path, _5_())
end
return {["create-url"] = create_url}
