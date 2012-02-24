n = STDIN.gets.chomp.to_i
scores = STDIN.gets.chomp.split(/ /).take(n).map(&:to_i)

amazings = 0
min = 100000
max = -1
scores.each_with_index do |score, i|
  if score < min
    min = score 
    amazings += 1 unless i == 0
  end
  if score > max
    max = score 
    amazings += 1 unless i == 0
  end
end
p amazings
