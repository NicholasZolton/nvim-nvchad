-- TEMPORARY: local neoink showcase demo plugin.
-- Delete this file (and run :Lazy sync) to remove it.
--
-- Depends on two sibling checkouts existing:
--   ~/Documents/Projects/Neoink-Calendar-Example  (this plugin)
--   ~/Documents/Projects/neoink                    (the neoink runtime)
--
-- `dist/host` is already built, so no `build` step is needed. To rebuild
-- after changes:  cd ~/Documents/Projects/Neoink-Calendar-Example && bun run build
--
-- Run :NeoinkShowcase to open the gallery (Calendar, Gradient Bang, Live Dashboard).
return {
  {
    "nicholaszolton/neoink-showcase",
    dir = vim.fn.expand "~/Documents/Projects/Neoink-Calendar-Example",
    name = "neoink-showcase",
    enabled = true,
    cond = not vim.g.vscode,
    cmd = "NeoinkShowcase",
  },
}
