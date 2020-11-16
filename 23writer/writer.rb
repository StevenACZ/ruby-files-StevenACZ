require_relative "../22document/document"

option, filename = ARGV

case option
when "write"
  puts "Enter a multi line response ending with a tab"
  input = $stdin.gets(":exit").chomp(":exit")
  file_title = input.split("\n").last
  File.write(filename, input, mode: "w")
  File.rename(filename, "#{file_title}.txt")
when "read"
  puts File.read(filename)
when "add"
  puts "Enter a multi line response ending with a tab"
  input = $stdin.gets(":exit").chomp(":exit")
  file_title = input.split("\n").last
  File.write(filename, input, mode: "a")
  File.rename(filename, "#{file_title}.txt")
when "size"
  size = File.size(filename)
  puts "#{filename} size: #{size} bytes"
when "lines_count"
  n_lines = 0
  File.foreach(filename) { n_lines += 1 }
  puts "#{filename} has #{n_lines} lines"
when "words_count"
  n_words = 0
  File.foreach(filename) do |line|
    line.chomp.each_char { n_words += 1 }
  end
  puts "#{filename} has #{n_words} words"
end
