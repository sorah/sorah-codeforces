n = STDIN.gets.chomp.to_i
the_cards = n.times.map { STDIN.gets.chomp.split(/ /).map(&:to_i) }

use = ->(point, counter, card) { [point + card[0], counter - 1 + card[1]] }
sort_card = ->(cards) { cards.sort {|a,b| (_ = a[1] <=> b[1]).zero? ? (a[0] <=> b[0]) : _ } }

solve = ->(cards, point, counter) do
  while !counter.zero? && !cards.empty?
    cards = sort_card[cards]
    card = cards.pop
    point, counter = use[point, counter, card]
  end
  point
end

p solve[the_cards,0,1]
