require "./myHTMLFunctions"

# 曜日を日曜日を0、月曜日を1...土曜日を6として返す。
def youbi(y, m, d)
	y = y.to_i
	m = m.to_i
	d = d.to_i
	if m == 1
		y = y-1
		m = 13
	elsif m == 2
		y = y-1
		m = 14
	end
	return (y + (y/4).floor - (y/100).floor + (y/400).floor + ((13*m+8)/5).floor + d)%7;
end

# カレンダーを表のhtmlにして返す。
def calendar(y, m)
	colors = ["red", "black", "black", "black", "black", "black", "blue"]
	html = ""
	html << '<table border="1">'
	html << '<tr><td colspan="7"><center><b>'
	html << color("black", aNonStyleBlack("../#{y}/#{m}", y.to_s + '/' + m.to_s ))
    html << '</b></center></td></tr>'
	html << "<tr>"
	th_data.push "日"
	th_data.push "月" 
	th_data.push "火" 
	th_data.push "水" 
	th_data.push "木"
	th_data.push "金"
	th_data.push "土"

	days = ""
	case m
	when 1, 3, 5, 7, 8, 10, 12 then
		days = 1..31
	when 4, 6, 9, 11 then
		days = 1..30
	when 2 then
		if isUruu(y) then
			days = 1..29
		else 
			days = 1..28
		end
	end

	weeks = []
	w = Array.new(7, 0)
	for d in days do
		w[youbi(y, m, d)] = d
		if youbi(y, m, d) == 6 || d == days.last then
			weeks.push(w)
			w = Array.new(7, 0)
		end
	end

	# カレンダーの日付部分のhtmlを作成
	for w in weeks do
		html << "<tr>"
		for d in w do
			if d == 0 then
				d = " "
			end
			html << td(color(colors[youbi(y, m, d)], d))
		end
		html << "</tr>"
	end
	html << "</table>"

	return html
end

# 月曜日から始まるカレンダーを表のhtmlにして返す。
def mcalendar(y, m)
	colors = ["black", "black", "black", "black", "black", "blue", "red"]
	html = ""
	html << '<table border="1">'
	html << '<tr><td colspan="7"><center><b>'
	html << color("black", aNonStyleBlack("../#{y}/#{m}", y.to_s + '/' + m.to_s ))
    html << '</b></center></td></tr>'
	html << "<tr>"
	html << th("月") +  th("火") + th("水") 
	html << th("木") + th("金") +  th("土") + th("日") + "</tr>"

	days = ""
	case m
	when 1, 3, 5, 7, 8, 10, 12 then
		days = 1..31
	when 4, 6, 9, 11 then
		days = 1..30
	when 2 then
		if isUruu(y) then
			days = 1..29
		else 
			days = 1..28
		end
	end

	weeks = []
	w = Array.new(7, 0)
	for d in days do
		w[youbi(y, m, d)] = d
		if youbi(y, m, d) == 6 || d == days.last then
			weeks.push(w)
			w = Array.new(7, 0)
		end
	end

	# カレンダーの日付部分のhtmlを作成
	for w in weeks do
		html << "<tr>"
		sunday = w[0]
		w.shift()
		w.push(sunday)
		for d in w do
			if d == 0 then
				d = " "
			end
			html << td(color(colors[youbi(y, m, d)], d))
		end
		html << "</tr>"
	end
	html << "</table>"

	return html
end



# うるう年の判定
def isUruu(y)
	if (y%4 == 0 && y%100 != 0) || (y%4 == 0 && y%100 == 0 && y%400 == 0) then
		return true
	else
		return false
	end
end

