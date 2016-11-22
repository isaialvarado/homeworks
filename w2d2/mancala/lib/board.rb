require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    cups.each_index do |i|
      next if [6, 13].include?(i)
      4.times { cups[i] << :stone }
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1, 6) || start_pos.between?(7, 12)
      raise 'Invalid starting cup'
    end
  end

  def make_move(start_pos, current_player_name)
    opponent_store = current_player_name == @name1 ? 13 : 6
    stones = cups[start_pos].size
    cups[start_pos] = []
    cup_idx = start_pos

    until stones.zero?
      cup_idx += 1
      cup_idx %= 14
      unless cup_idx == opponent_store
        cups[cup_idx] << :stone
        stones -= 1
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].flatten.empty? || cups[7..12].flatten.empty?
  end

  def winner
    case cups[6].size <=> cups[13].size
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end
end
