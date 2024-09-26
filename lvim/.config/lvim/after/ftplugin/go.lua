local dap = require("dap")

-- should install delve
-- eg: go install github.com/go-delve/delve/cmd/dlv@latest

dap.adapters.delve = function(cb, config)
  if config.mode == "remote" and config.request == "attach" then
    cb({
      type = "server",
      host = config.host or '127.0.0.1',
      port = config.port or '38697',
    })
  else
    cb({
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
        detached = vim.fn.has('win32') == 0,
      }
    })
  end
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFiledirname}"
  }
}
