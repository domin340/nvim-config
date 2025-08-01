local lsps = {
  teal_ls = {
    cmd = { "C:/lua5.4.2/tls/bin/teal-language-server.bat" },
  }
}

---@return fun(tbl: table, last_index: string)
function lsps:list()
  return function (_, last_index)
    local index, val = next(self, last_index)
    while index do
      if type(val) ~= "function" then
        return index, val
      end
      index, val = next(self, index)
    end
  end
end

return lsps

