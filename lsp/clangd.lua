return {
    cmd = {
        "clangd",
        "--query-driver=/usr/bin/g++",
        "--background-index",
    },
    filetypes = { "cpp" } 
}
