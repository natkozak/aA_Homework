require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # byebug
    @cups.each.with_index do |cup, i|
      next if i == 6 || i == 13
      cup.concat([:stone, :stone, :stone, :stone])
      # if i == 6 || i == 13 #why doesn't this work?
      #   cup = []
      # end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0,12)
      raise "Invalid starting cup"
    end
    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    #empties cup
    counter = @cups[start_pos].length 
    @cups[start_pos] = []

    pos = (start_pos + 1) % 14
    while counter > 0
      
      counter -= 1
      if pos == 6
        @cups[6].concat([:stone]) if current_player_name == @name1
      elsif pos == 13
        @cups[13].concat([:stone]) if current_player_name == @name2
      else
        @cups[pos].concat([:stone])
      end
      pos = (pos + 1) % 14
    end
    render
    return next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    
    if @cups[ending_cup_idx].length < 2
      return :switch
    elsif !@cups[ending_cup_idx].empty?
      return ending_cup_idx
    elsif pos == 6
      return :prompt
    elsif pos == 13
      return :prompt
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
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
