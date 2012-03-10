n,d = STDIN.gets.chomp.split(/ /).map(&:to_i)
messages_raw = n.times.map{ from,to,time=STDIN.gets.chomp.split(/ /); {from: from.to_sym, to: to.to_sym, time: time.to_i } }
messages = {}
friends = []

messages_raw.each do |message|
  _ = [message[:from],message[:to]]
  a = _.sort
  if messages[_]
    t = message[:time] - messages[_]
    messages.delete a
    if 0 < t && t <= d
      friends << a
    end
  end
  messages[_.reverse] = message[:time]
end
friends.uniq!

p friends.size
puts friends.map{|x| x.join(' ') }
