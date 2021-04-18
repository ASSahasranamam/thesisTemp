local ran_ok, error = pcall(function() local kpse = require("kpse") kpse.set_program_name("luatex") local lfs = require("lfs") local cacheDir = "./_markdown___latexindent_temp" if not lfs.isdir(cacheDir) then assert(lfs.mkdir(cacheDir)) end local md = require("markdown") local convert = md.new({cacheDir = "./_markdown___latexindent_temp", frozenCacheFileName = "./_markdown___latexindent_temp/frozenCache.tex", frozenCacheCounter = 0, hashEnumerators = true, smartEllipses = true, } ) local file = assert(io.open("./__latexindent_temp.markdown.in", "r")) local input = assert(file:read("*a")) assert(file:close()) print(convert(input:gsub("\r\n?", "\n") .. "\n")) end) if not ran_ok then local file = io.open("./__latexindent_temp.markdown.err", "w") if file then file:write(error .. "\n") file:close() end print('\\markdownError{An error was encountered while executing Lua code}{For further clues, examine the file "./__latexindent_temp.markdown.err"}') end
