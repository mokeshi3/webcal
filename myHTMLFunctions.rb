def tr(b)
	return sand("tr", b)
end

def th(b)
	return sand("th", b)
end

def td(b)
	return sand("td", b)
end

def color(c, b)
	return sand("font color=\"#{c}\"", b)
end

def a(href, text)
	return sand("a href=#{href}", text)
end

def aNonStyleBlack(href, text)
	return sand("a href=\"#{href}\" style=\"text-decoration: none;color: #000000;\"", text)
end

def sand(a, b)
	return "<" + a.to_s + ">" + b.to_s + "</" + a.to_s + ">"
end

