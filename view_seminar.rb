require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/view_seminar' do

  db = SQLite3::Database.new('scraping.db')
  db.results_as_hash = true

  html = '<h1>goodfindセミナー一覧</h1>'

  html << "<dl>"
  db.execute('SELECT * FROM seminars;') do |row|
    puts row
    html << "<dt>#{row["title"]}</dt>"
    html << "<dd>#{row["sub_title"]}</dd>"
  end
  html << "</dl>"

  return html
end
