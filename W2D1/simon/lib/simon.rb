class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Lets play Simon says!"
    sleep(1)
    system "clear"
    puts "Memorize the following sequence"
    sleep(1)
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end
  

  def take_turn
    show_sequence
    require_sequence

    unless game_over == true
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system "clear"
    puts "Ready?"
    sleep(1)
    system "clear"

    
    self.seq.each do |color|
      puts color
      sleep(1)
      system "clear"
      sleep(0.2)
    end
  end

  def require_sequence
    puts "repeat the sequence by entering the first letter of each color on a new line"
    self.seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        self.game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.shuffle.sample
  end

  def round_success_message
    puts "Great job! Here's the next sequence:"
  end

  def game_over_message
    puts "Bummer! You lasted #{sequence_length - 1} rounds"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

simon = Simon.new
simon.play