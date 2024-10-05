FRAMING = {
    cpp = {signs = {"/* ", " * ", " */"}, width = 76},
    bas = {signs = {"# ", "# ", ""}, width = 77},
}

function comment_it(rows, lang)
    opts = FRAMING[lang]
    local length = table.getn(rows)
    local result = {}
    for i, row in pairs(rows) do

        if i == 1 then
            table.insert(result, opts.signs[1] .. row)
        elseif i == length then
            table.insert(result, opts.signs[3] .. row)
        else
            table.insert(result, opts.signs[2] .. row)
        end

    end
    return result
end

function code_frame(word, lang)
    opts = FRAMING[lang]

    top = "." .. string.rep("-", (opts.width - 2)) .. "."
    mid = "|" .. string.rep(" ", (opts.width - 2)) .. "|"
    btm = "'" .. string.rep("-", (opts.width - 2)) .. "'"

    local wordlen = string.len(word)
    local title = "|" .. string.rep(" ", 4) .. word .. string.rep(" ", opts.width - 2 - 4 - wordlen) .. "|"

    local result =  {top, mid, title, mid, btm, ""}
    local commented = comment_it(result, lang)

    table.insert(commented, 1, "")
    table.insert(commented, "")
    table.insert(commented, "")

    return commented
end
