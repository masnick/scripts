 # USAGE: ruby stem.rb path/to/file/to/stem.txt

require 'rubygems'
require 'stemmer'

h = Hash.new
f = IO.read(ARGV[0]).split("\n")
f.each do |line|
  words = line.gsub('"','').gsub(/[^a-z0-9\s]/i, ' ').gsub(/ {2,}/,' ').split(' ')
  words.each do |w|
    w = w.downcase.stem
    next if w == ""
    if h.has_key?(w)
      h[w] = h[w] + 1
    else
      h[w] = 1
    end
  end

end


out = ""
h.sort{|a,b| b[1]<=>a[1]}.each do |elem|
  out << "\"#{elem[0]}\" has #{elem[1]} occurrences\n"
end
puts out
