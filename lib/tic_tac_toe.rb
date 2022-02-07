require_relative 'fillable'

# Main components of the game
class Game
  include Fillable

  @@draw = false

  def play_game(player1 = nil, player2 = nil)
    print 'Enter player 1 name: '
    player1 = get_player if player1.nil?

    print 'Enter player 2 name: '
    player2 = get_player(player1) if player2.nil?

    loop do
      break if game_over?(player2)

      player_loop(player1)
      break if game_over?(player1)

      player_loop(player2)
    end
  end

  def get_player(other_player = nil)
    name = gets.chomp
    if other_player.nil?
      print 'Choose \'O\' or \'X\': '
      tool = gets.chomp.upcase
    else
      tool = other_player.tool == 'O' ? 'X' : 'O'
    end
    puts "#{name} = #{tool}"
    Player.new(name, tool)
  end

  def player_loop(player)
    puts "#{player.name}'s turn"
    create_grid
    play_turn(player)
    update_winning_conditions
    check_winner(player)
  end

  private

  def game_over?(player)
    player.won || @@draw
  end

  def play_turn(player)
    print 'Make your move: '
    choice = gets.chomp

    case choice
    when '1'
      @@row1[0] = player.tool
    when '2'
      @@row1[4] = player.tool
    when '3'
      @@row1[8] = player.tool
    when '4'
      @@row2[0] = player.tool
    when '5'
      @@row2[4] = player.tool
    when '6'
      @@row2[8] = player.tool
    when '7'
      @@row3[0] = player.tool
    when '8'
      @@row3[4] = player.tool
    when '9'
      @@row3[8] = player.tool
    else
      puts 'Invalid, you lost your turn.'
    end
  end

  # Tested inside #player_loop
  def check_winner(player)
    if @@winning_conditions.any? { |line| line.all? { |cell| cell == player.tool } }
      create_grid
      puts "#{player.name} won!"
      player.won = true
    elsif [@@row1[0], @@row1[4], @@row1[8], @@row2[0], @@row2[4], @@row2[8], @@row3[0], @@row3[4],
           @@row3[8]].all? do |cell|
            %w[O X].include?(cell)
          end
      create_grid
      puts 'Draw!'
      @draw = true
    end
  end

  def create_grid
    puts @@row1
    puts @@placeholder
    puts @@row2
    puts @@placeholder
    puts @@row3
  end
end

# Individual players
class Player
  attr_reader :name
  attr_accessor :tool, :won

  def initialize(name, tool)
    @name = name
    @tool = tool
    @won = false
  end
end

# game = Game.new
# game.play_game
