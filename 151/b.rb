def pizza?(num)
  num = num.gsub(/-/,'').chars.map(&:to_i)
  prev = 10
  num.each do |n|
    if prev > n
      prev = n
    else
      return false
    end
  end
  true
end

def taxi?(num)
  a = num[0]
  num.gsub(/[#{a}\-]/,'').size.zero?
end

def girl?(num)
  !taxi?(num) && !pizza?(num)
end

def which(num)
  return :taxi if taxi?(num)
  return :pizza if pizza?(num)
  return :girl
end

dics = {}
n = STDIN.gets.chomp.to_i
n.times do
  i, name = STDIN.gets.chomp.split(/ /)
  i = i.to_i
  dics[name] = {taxi: 0, pizza: 0, girl: 0}

  i.times do
    num = STDIN.gets.chomp
    dics[name][which(num)] += 1
  end
end

{taxi: "If you want to call a taxi, you should call: ",
 pizza: "If you want to order a pizza, you should call: ",
 girl: "If you want to go to a cafe with a wonderful girl, you should call: "}.each do |type, head|
  max = dics.map{|k,v| v[type] }.max
  puts head+dics.select{|k,v| v[type] == max }.keys.join(", ")+"."
end
