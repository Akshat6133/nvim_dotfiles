local M = {}

-- Function to insert a C "Hello, World!" snippet
function M.insert_hello_world()
    local lines = {
        "#include <stdio.h>",
        "",
        "int main() {",
        '    printf("Hello, World!\\n");',
        "    return 0;",
        "}"
    }
    vim.api.nvim_put(lines, "l", true, true)
end

-- Function to insert a C function template
function M.insert_function()
    local lines = {
        "void function_name() {",
        "    // TODO: Implement function",
        "}"
    }
    vim.api.nvim_put(lines, "l", true, true)
end

return M
