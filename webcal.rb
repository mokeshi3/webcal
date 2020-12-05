require "sinatra"
require "./calendar"

set :environment, :production

get '/' do
	@msg = '上のURLに[/2020/6]とか入れるとカレンダーを表示するよ'
end

get '/:y' do
	y = "#{params[:y]}".to_i
	@msg = ""
	@msg << '<table><tr>'
	@msg << '<td valign="top">' + calendar(y, 1) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 2) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 3) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 4) + '</td>'
	@msg << "</td></tr></table>"

	@msg << '<table><tr>'
	@msg << '<td valign="top">' + calendar(y, 5) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 6) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 7) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 8) + '</td>'
	@msg << "</td></tr></table>"

	@msg << '<table><tr>'
	@msg << '<td valign="top">' + calendar(y, 9) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 10) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 11) + '</td>' 
	@msg << '<td valign="top">' + calendar(y, 12) + '</td>'
	@msg << "</td></tr></table>"
end

get '/:y/:m' do
	y = "#{params[:y]}".to_i
	m = "#{params[:m]}".to_i
	d = "#{params[:d]}".to_i
	#@msg = "Youbi is #{Youbi(y, m, d)}"
	@msg = calendar(y, m);
end

get '/:y/:m/:d' dk
	y = "#{params[:y]}".to_i
	m = "#{params[:m]}".to_i
	d = "#{params[:d]}".to_i
	#@msg = "Youbi is #{Youbi(y, m, d)}"
	@msg = calendar(y, m);
end

