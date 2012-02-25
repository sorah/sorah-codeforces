n,m = STDIN.gets.chomp.split(/ /).map(&:to_i)

s = n.times.map do
  STDIN.gets.chars.map(&:to_i).take(m)
end

max = 0.upto(m-1).map do |i|
  s.max{|a,b| a[i] <=> b[i] }[i]
end
f = s.map do |student|
  max.each_with_index.any? do |m,i|
    student[i] >= m
  end
end
p f.select{|x| x }.size
