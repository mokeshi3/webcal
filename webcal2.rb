require "sinatra"
require "./calendar"
require "./myHTMLFunctions"

set :environment, :production

get '/' do
	@msg = '上のURLに[/2020/6]のように入力するとカレンダーを表示します'
end

get '/:y' do
	y = "#{params[:y]}".to_i

	# 前年と来年へのリンクを生成
	py = y-1
	ny = y+1
	@link = a(href="../#{py}", "<#{py}年") + " "
	#@link << a(href="../#{y}", "年間表") + " "
	@link << a(href="../#{ny}", "#{ny}年>")

	@calendar = ""
	@calendar << '<table><tr>'
	@calendar << '<td valign="top">' + calendar(y, 1) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 2) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 3) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 4) + '</td>'
	@calendar << "</td></tr></table>"

	@calendar << '<table><tr>'
	@calendar << '<td valign="top">' + calendar(y, 5) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 6) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 7) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 8) + '</td>'
	@calendar << "</td></tr></table>"

	@calendar << '<table><tr>'
	@calendar << '<td valign="top">' + calendar(y, 9) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 10) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 11) + '</td>' 
	@calendar << '<td valign="top">' + calendar(y, 12) + '</td>'
	@calendar << "</td></tr></table>"
	erb :index
end

get '/:y/:m' do
	y = "#{params[:y]}".to_i
	m = "#{params[:m]}".to_i
	@msg = ""

	# 前の月と次へのリンクを生成
	pm = m-1
	py = y
	if pm <= 0 then
		pm = 12
		py = y-1
	end
	nm = m + 1
	ny = y
	if nm >= 12 then
		nm = 1
		ny = y + 1
	end
	@link = a(href="../#{py}/#{pm}", "<#{py}/#{pm}") + " "
	@link << a(href="../#{y}", "年間表") + " "
	@link << a(href="../#{ny}/#{nm}", "#{ny}/#{nm}>")

	# カレンダーを生成
	@calendar = calendar(y, m);
	erb :index
end

get '/:y/:m/:d' do
	y = "#{params[:y]}".to_i
	m = "#{params[:m]}".to_i
	d = "#{params[:d]}".to_i
	@calendar = calendar(y, m);
	erb :index
end

get 'm/:y/:m' do
	y = "#{params[:y]}".to_i
	m = "#{params[:m]}".to_i
	@msg = ""

	# 前の月と次へのリンクを生成
	pm = m-1
	py = y
	if pm <= 0 then
		pm = 12
		py = y-1
	end
	nm = m + 1
	ny = y
	if nm >= 12 then
		nm = 1
		ny = y + 1
	end
	@link = a(href="../#{py}/#{pm}", "<#{py}/#{pm}") + " "
	@link << a(href="../#{y}", "年間表") + " "
	@link << a(href="../#{ny}/#{nm}", "#{ny}/#{nm}>")

	# カレンダーを生成
	@calendar = mcalendar(y, m)
	erb :index
end
