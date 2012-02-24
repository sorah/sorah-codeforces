n,m = STDIN.gets.chomp.split(/ /).map(&:to_i)
stat = {}

def gcm(a, b)
  i,j = a,b
  a, b = b, a if a < b
  while b >= 0
    if a == 0 || b == 0
      a,b = [a, b].max, -1
    elsif a/b != 0
      a,b = b, a%b
    else
      a,b = b, -1
    end
  end
  a
end

m.times.each do
  t,i = STDIN.gets.chomp.split(/ /)
  i = i.to_i

  case t
  when '+'
    if stat[i]
      puts "Already on"
    else
      f = nil
      if stat.each_key.all?{|k| gcm(f=k,i) == 1 }
        stat[i] = true
        puts "Success"
      else
        puts "Conflict with #{f}"
      end
    end
  when '-'
    if stat[i]
      puts "Success"
      stat.delete(i)
    else
      puts "Already off"
    end
  end
end

