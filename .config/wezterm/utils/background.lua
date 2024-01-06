local M = {}

M.get_background = function(opacity)
	return {
		source = { Gradient = { colors = { "#000000" or "#111111" } } },
    width = "100%",
    height = "100%",
    opacity = opacity
	}
end

return M
