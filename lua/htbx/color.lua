local M = {}

function M.text2rgb(color)
	color = color:gsub('^#', '')

	return {
		r = tonumber(color:sub(1, 2), 16),
		g = tonumber(color:sub(3, 4), 16),
		b = tonumber(color:sub(5, 6), 16),
	}
end

function M.rgb2hsl(rgb)
	local c_max = math.max(rgb.r, rgb.g, rgb.b)
	local c_min = math.min(rgb.r, rgb.g, rgb.b)
	local delta = c_max - c_min

	local h
	local l = (c_max + c_min) / 510

	if     delta == 0     then h = 0
	elseif c_max == rgb.r then h = 60 * ((rgb.g - rgb.b) / delta % 6)
	elseif c_max == rgb.g then h = 60 * ((rgb.b - rgb.r) / delta + 2)
	else                       h = 60 * ((rgb.r - rgb.g) / delta + 4)
	end

	if h < 0 then h = h + 360 end
	local s = delta / (255 * (1 - math.abs(2 * l - 1)))

	return { h = h, s = s, l = l }
end

function M.hsl2rgb(hsl)
	local c = (1 - math.abs(2 * hsl.l - 1)) * hsl.s
	local h = hsl.h / 60
	local x = c * (1 - math.abs((h % 2) - 1))
	local m = hsl.l - c / 2

	if     h >= 0 and h < 1 then r, g, b = c, x, 0
	elseif h >= 1 and h < 2 then r, g, b = x, c, 0
	elseif h >= 2 and h < 3 then r, g, b = 0, c, x
	elseif h >= 3 and h < 4 then r, g, b = 0, x, c
	elseif h >= 4 and h < 5 then r, g, b = x, 0, c
	else                         r, g, b = c, 0, x
	end

	return {
		r = math.floor((r + m) * 255 + 0.5),
		g = math.floor((g + m) * 255 + 0.5),
		b = math.floor((b + m) * 255 + 0.5)
	}
end

function M.rgb2text(rgb)
	return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

function M.saturation(s, text)
	local rgb = M.text2rgb(text)
	local hsl = M.rgb2hsl(rgb)
	hsl.s = s
	rgb = M.hsl2rgb(hsl)
	return M.rgb2text(rgb)
end

function M.lightness(l, text)
	local rgb = M.text2rgb(text)
	local hsl = M.rgb2hsl(rgb)
	hsl.l = l
	rgb = M.hsl2rgb(hsl)
	return M.rgb2text(rgb)
end

function M.change_hsl(text, map)
	local rgb = M.text2rgb(text)
	local hsl = M.rgb2hsl(rgb)

	if map.h then hsl.h = math.min(1.0, hsl.h * map.h) end
	if map.s then hsl.s = math.min(1.0, hsl.s * map.s) end
	if map.l then hsl.l = math.min(1.0, hsl.l * map.l) end

	rgb = M.hsl2rgb(hsl)
	return M.rgb2text(rgb)
end

return M
