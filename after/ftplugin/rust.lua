local bufnr = vim.api.nvim_get_current_buf()
local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

-- Hover & docs
map("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, "Rust: hover actions")
map("n", "<leader>rD", function()
	vim.cmd.RustLsp({ "hover", "range" })
end, "Rust: hover range")

-- Code actions
map("n", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction")
end, "Rust: code action")
map("v", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction")
end, "Rust: code action")

-- Diagnostics
map("n", "<leader>re", function()
	vim.cmd.RustLsp("explainError")
end, "Rust: explain error")
map("n", "<leader>rR", function()
	vim.cmd.RustLsp("renderDiagnostic")
end, "Rust: render diagnostic")
map("n", "<leader>rd", function()
	vim.cmd.RustLsp("relatedDiagnostics")
end, "Rust: related diagnostics")
map("n", "]e", function()
	vim.cmd.RustLsp({ "explainError", "cycle" })
end, "Rust: next error")
map("n", "[e", function()
	vim.cmd.RustLsp({ "explainError", "cycle_prev" })
end, "Rust: prev error")

-- Inlay hints toggle
map("n", "<leader>rh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
end, "Rust: toggle inlay hints")

-- Run / debug
map("n", "<leader>rr", function()
	vim.cmd.RustLsp("runnables")
end, "Rust: runnables")
map("n", "<leader>ru", function()
	vim.cmd.RustLsp("run")
end, "Rust: run at cursor")
map("n", "<leader>rb", function()
	vim.cmd.RustLsp({ "runnables", bang = true })
end, "Rust: rerun last")
map("n", "<leader>rg", function()
	vim.cmd.RustLsp("debuggables")
end, "Rust: debuggables")

-- Tests
map("n", "<leader>rt", function()
	vim.cmd.RustLsp("testables")
end, "Rust: testables")
map("n", "<leader>rT", function()
	vim.cmd.RustLsp("relatedTests")
end, "Rust: related tests")

-- Navigation
map("n", "<leader>rm", function()
	vim.cmd.RustLsp("parentModule")
end, "Rust: parent module")
map("n", "<leader>ro", function()
	vim.cmd.RustLsp("openCargo")
end, "Rust: open Cargo.toml")
map("n", "<leader>rO", function()
	vim.cmd.RustLsp("openDocs")
end, "Rust: open docs.rs")

-- Refactoring
map("n", "<leader>rM", function()
	vim.cmd.RustLsp("expandMacro")
end, "Rust: expand macro")
map("n", "<leader>rJ", function()
	vim.cmd.RustLsp("joinLines")
end, "Rust: join lines")
map("n", "<leader>rp", function()
	vim.cmd.RustLsp("rebuildProcMacros")
end, "Rust: rebuild proc macros")
map("n", "<leader>rs", function()
	vim.cmd.RustLsp({ "moveItem", "up" })
end, "Rust: move item up")
map("n", "<leader>rx", function()
	vim.cmd.RustLsp({ "moveItem", "down" })
end, "Rust: move item down")

-- Fly check
map("n", "<leader>rf", function()
	vim.cmd.RustLsp({ "flyCheck", "run" })
end, "Rust: fly check")
