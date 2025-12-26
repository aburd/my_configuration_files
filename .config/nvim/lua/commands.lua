local translate_to_ja_callback = function (args)
  local lines = {}
  -- detect if the user includes a bang
  -- if args.bang == true then
  --     table.insert(lines, "bang was used")
  -- else
  --     table.insert(lines, "bang was not used")
  -- end
  print(args)

  vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
  vim.cmd({
    cmd = "TranslateR",
    args ={
      "--target_lang=ja",
      "--source_lang=en",
      "foo"
    }
  })
  -- vim.api.nvim_put(res, "", true, true)
end

vim.api.nvim_create_user_command("ToJa", translate_to_ja_callback, {
    nargs = 0,
    desc = "Translate to Japanese",
    -- enable bang detection
    bang = true,
})
