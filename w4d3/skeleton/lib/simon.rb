class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @game_over = false
    @seq = []
    @sequence_length = sequence_length
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    @sequence_length.times {add_random_color}
    @seq.each do |color|
      puts color
    end
  end

  def require_sequence
    input = gets.chomp
    colors = input.split
    if colors != seq
      @game_over = true
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "round won!"
  end

  def game_over_message
    puts "game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
