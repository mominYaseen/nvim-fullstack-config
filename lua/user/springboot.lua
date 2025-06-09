
-- ~/.config/nvim/lua/user/springboot.lua
local M = {}

local job_id = nil
local term_buf = nil

function M.run()
  if job_id then
    vim.notify("Spring Boot is already running.", vim.log.levels.INFO)
    return
  end

  vim.cmd("botright split | terminal mvn spring-boot:run")
  term_buf = vim.api.nvim_get_current_buf()
  job_id = vim.b.terminal_job_id
  vim.notify("Spring Boot started in terminal.", vim.log.levels.INFO)
end

function M.stop()
  if job_id then
    vim.fn.jobstop(job_id)
    vim.notify("Spring Boot stopped.", vim.log.levels.INFO)
    job_id = nil
    term_buf = nil
  else
    vim.notify("No Spring Boot process running.", vim.log.levels.WARN)
  end
end

function M.toggle()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.cmd("buffer " .. term_buf)
  else
    M.run()
  end
end

return M
