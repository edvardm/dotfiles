local M = {}

function M.add_task(task_name, command)
  if not task_name or task_name == "" then
    task_name = vim.fn.input("Task name: ")
    if task_name == "" then
      print("Task name is required")
      return
    end
  end

  if not command or command == "" then
    command = vim.fn.input("Command: ")
    if command == "" then
      print("Command is required")
      return
    end
  end

  local taskfile_path = "Taskfile.yml"

  if vim.fn.filereadable(taskfile_path) == 0 then
    vim.fn.system("task --init")
    if vim.v.shell_error ~= 0 then
      print("Failed to initialize Taskfile.yml")
      return
    end
  end

  local task_content = string.format(
    [[
  %s:
    desc: 
    cmd: %s

]],
    task_name,
    command
  )

  local file = io.open(taskfile_path, "a")
  if not file then
    print("Failed to open Taskfile.yml")
    return
  end

  file:write(task_content)
  file:close()

  print(string.format("Added task '%s' to Taskfile.yml", task_name))
end

vim.api.nvim_create_user_command("NewTask", function(opts)
  local args = vim.split(opts.args, " ", { plain = true })
  local task_name = args[1]
  local command = table.concat(args, " ", 2)
  M.add_task(task_name, command)
end, {
  nargs = "*",
  desc = "Add new task to Taskfile.yml",
})

vim.keymap.set("n", "<leader>tn", function()
  M.add_task()
end, { desc = "Add new task to Taskfile.yml" })

return M
