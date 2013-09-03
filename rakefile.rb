# encoding: utf-8
require 'bluecloth'

task :default do
  file = Dir['S*.md'].sort.last
  bc = BlueCloth.new File.read(file) + File.read('footer.md')
  puts bc.to_html
end

desc "Generate habrahabr compatible html file. Use rake habr file=filename.md not for last file"
task :habr do
  if ENV['file']
    file = ENV['file']
  else
    file = Dir['S*.md'].sort.last
  end

  bc = BlueCloth.new File.read(file)
  res = bc.to_html
  url = "http://rubynoname.ru/posts/2013/#{file.split('.').first}.html"
  res = %Q[Ссылка на выпуск подкаста: <a href="#{url}">#{url}</a>\n\n] + res
  res.sub!(/<\/ul>/, "</ul>\n<habracut>\n")

  puts "RubyNoName Podcast " + file.split('.').first.upcase + ":"
  puts
  puts res
end
