require 'bluecloth'

task :default do
  file = Dir['S*.md'].sort.last
  bc = BlueCloth.new File.read(file)
  puts bc.to_html
end
