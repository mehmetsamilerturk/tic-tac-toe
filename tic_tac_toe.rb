class Player
  attr_reader :name
  attr_accessor :tool

  def initialize(name)
    @name = name
    @tool = 'O'
  end
end

def play_turn(player)
  print 'Make your move: '
  choice = gets.chomp

  case choice
  when '1'
    $row1[0] = player.tool
  when '2'
    $row1[4] = player.tool
  when '3'
    $row1[8] = player.tool
  when '4'
    $row2[0] = player.tool
  when '5'
    $row2[4] = player.tool
  when '6'
    $row2[8] = player.tool
  when '7'
    $row3[0] = player.tool
  when '8'
    $row3[4] = player.tool
  when '9'
    $row3[8] = player.tool
  else
    puts 'Invalid, you lost your turn.'
  end
end

$row1 = '1 | 2 | 3'
$row2 = '4 | 5 | 6'
$row3 = '7 | 8 | 9'
$placeholder = '--+---+---'

def create_grid
  puts $row1
  puts $placeholder
  puts $row2
  puts $placeholder
  puts $row3
end

print 'Enter player 1 name: '
player1_name = gets.chomp
player1 = Player.new(player1_name)
puts "#{player1_name} = #{player1.tool}"

print 'Enter player 2 name: '
player2_name = gets.chomp
player2 = Player.new(player2_name)
player2.tool = 'X'
puts "#{player2_name} = #{player2.tool}"

loop do
  puts "#{player1_name}'s turn"
  create_grid
  play_turn(player1)

  winning_conditions = [[$row1[0], $row1[4], $row1[8]], [$row1[0], $row1[4], $row1[8]].reverse,
                        [$row2[0], $row2[4], $row2[8]], [$row2[0], $row2[4], $row2[8]].reverse,
                        [$row3[0], $row3[4], $row3[8]], [$row3[0], $row3[4], $row3[8]].reverse,
                        [$row1[0], $row2[0], $row3[0]], [$row1[0], $row2[0], $row3[0]].reverse,
                        [$row1[4], $row2[4], $row3[4]], [$row1[4], $row2[4], $row3[4]].reverse,
                        [$row1[8], $row2[8], $row3[8]], [$row1[8], $row2[8], $row3[8]].reverse,
                        [$row1[0], $row2[4], $row3[8]], [$row1[0], $row2[4], $row3[8]].reverse,
                        [$row1[8], $row2[4], $row3[0]], [$row1[8], $row2[4], $row3[0]].reverse]

  if winning_conditions.any? { |line| line.all? { |cell| cell == 'O' } }
    create_grid
    puts "#{player1_name} won!"
    break
  elsif [$row1[0], $row1[4], $row1[8], $row2[0], $row2[4], $row2[8], $row3[0], $row3[4], $row3[8]].all? do |cell|
          %w[O X].include?(cell)
        end
    create_grid
    puts 'Draw!'
    break
  end

  puts "#{player2_name}'s turn"
  create_grid
  play_turn(player2)

  winning_conditions = [[$row1[0], $row1[4], $row1[8]], [$row1[0], $row1[4], $row1[8]].reverse,
                        [$row2[0], $row2[4], $row2[8]], [$row2[0], $row2[4], $row2[8]].reverse,
                        [$row3[0], $row3[4], $row3[8]], [$row3[0], $row3[4], $row3[8]].reverse,
                        [$row1[0], $row2[0], $row3[0]], [$row1[0], $row2[0], $row3[0]].reverse,
                        [$row1[4], $row2[4], $row3[4]], [$row1[4], $row2[4], $row3[4]].reverse,
                        [$row1[8], $row2[8], $row3[8]], [$row1[8], $row2[8], $row3[8]].reverse,
                        [$row1[0], $row2[4], $row3[8]], [$row1[0], $row2[4], $row3[8]].reverse,
                        [$row1[8], $row2[4], $row3[0]], [$row1[8], $row2[4], $row3[0]].reverse]

  if winning_conditions.any? { |line| line.all? { |cell| cell == 'X' } }
    create_grid
    puts "#{player2_name} won!"
    break
  elsif [$row1[0], $row1[4], $row1[8], $row2[0], $row2[4], $row2[8], $row3[0], $row3[4], $row3[8]].all? do |cell|
          %w[O X].include?(cell)
        end
    create_grid
    puts 'Draw!'
    break
  end
end
