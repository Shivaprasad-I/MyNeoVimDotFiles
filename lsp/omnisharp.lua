-- local lspconfig_util = require("lspconfig.util")
return {
    cmd = {
        "dotnet",
        -- "~/.omnisharp/OmniSharp",
        vim.fn.expand("~") .. "/.omnisharp/OmniSharp.dll",
        "-z",
        "--languageserver",
        "--hostPID", 
        tostring(vim.fn.getpid()),
        "--no-launch-browser",
    },
    root_markers = { ".sln", ".csproj", ".git" },
    filetypes = { "cs", "vb" },
    settings = {
        omnisharp = {
            enableRoslynAnalyzers = true,
            organizeImportsOnFormat = true,
            enableImportCompletion = true,
            enableFormatting = true,
            enableCodeActions = true
        },
    },
}
