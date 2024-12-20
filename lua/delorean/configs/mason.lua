-- TODO check if installed
opts = {
    ensure_installed = {
        "clangd",
        "clang-format",
        "black",
        "pyright",
        "isort"
    }
}
   
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
