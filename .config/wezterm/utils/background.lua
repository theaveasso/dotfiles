local M = {}

M.get_background = function()
	return {
		source = { Gradient = { colors = { "#000000" or "#111111" } } },
    width = "100%",
    height = "100%",
    opacity = 0.7
	}
end

return M
