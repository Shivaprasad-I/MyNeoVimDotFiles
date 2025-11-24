return {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/csharp-ls" },
  filetypes = { "cs" },
  root_markers = { ".sln",".csproj", ".git"},
  settings = {
    csharp = {
      enable_editorconfig_support = true,
      enable_ms_build_load = true,
      enable_roslyn_analyzers = true,
    }
  }
}
