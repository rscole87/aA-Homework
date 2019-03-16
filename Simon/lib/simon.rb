class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @sequence_length = sequence_length
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    while @game_over == false
      show_sequence
      if require_sequence
        @sequence_length += 1
        round_success_message
      else
        @game_over = true
        game_over_message
      end
    end
  end

  def show_sequence
    @seq.each { |color| puts color }
    add_random_color until @seq.length == sequence_length
    puts @seq.last
  end

  def require_sequence
    cur_guess = []
  
    until cur_guess.length == @seq.length
      puts "Enter a color:"
      cur_guess << gets.chomp
    end
    
    cur_guess.each_with_index do |color, i|
      if cur_guess[i] != @seq[i]
        return false
      end
      true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nice eye! Lets see if you can keep it up."
  end

  def game_over_message
    puts "Gotcha! You lose."
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end
