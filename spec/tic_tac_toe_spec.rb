require_relative '../lib/tic_tac_toe'

describe Game do
  describe '#get_player' do
    subject(:main_play) { described_class.new }

    context 'when first user enters input' do
      p1_name = 'bob'
      p1_tool = 'X'

      before do
        allow(main_play).to receive(:gets).and_return(p1_name, p1_tool)
        allow(main_play).to receive(:print)
        allow(main_play).to receive(:puts)
      end

      it 'allows first player to choose the tool' do
        player1 = main_play.get_player
        expect(player1.tool).to eq(p1_tool)
      end
    end

    context 'when second player enters input' do
      let(:first_player) { Player.new('john', 'X') }

      before do
        allow(main_play).to receive(:gets).and_return('jack')
        allow(main_play).to receive(:puts)
      end

      it 'assigns other tool to second player' do
        player2 = main_play.get_player(first_player)
        expect(player2.tool).to eq('O')
      end
    end
  end

  describe '#player_loop' do
    subject(:main_play) { described_class.new }

    context 'when first player fills 3 blocks' do
      let(:first_player) { Player.new('alex', 'O') }
      let(:second_player) { Player.new('amanda', 'X') }

      before do
        allow(main_play).to receive(:puts)
        allow(main_play).to receive(:print)
        allow(main_play).to receive(:gets).and_return('1', '4', '2', '5', '3')
      end

      it 'decides the winner correctly' do
        i = 1
        5.times do
          i.odd? ? main_play.player_loop(first_player) : main_play.player_loop(second_player)
          i += 1
        end
        expect(first_player.won).to eq(true)
      end

      it 'makes second player remain unchanged' do
        i = 1
        5.times do
          i.odd? ? main_play.player_loop(first_player) : main_play.player_loop(second_player)
          i += 1
        end
        expect(second_player.won).to eq(false)
      end
    end

    context 'when all the blocks are full' do
      let(:first_player) { Player.new('alex', 'O') }
      let(:second_player) { Player.new('amanda', 'X') }

      before do
        allow(main_play).to receive(:puts)
        allow(main_play).to receive(:print)
        allow(main_play).to receive(:gets).and_return('1', '4', '2', '3', '5', '8', '6', '9', '7')
      end

      it 'outputs the draw message' do
        expect(main_play).to receive(:puts).with('Draw!')
        i = 1
        9.times do
          i.odd? ? main_play.player_loop(first_player) : main_play.player_loop(second_player)
          i += 1
        end
      end
    end
  end

  describe '#play_game' do
    subject(:main_play) { described_class.new }

    context 'when the game is played' do
      let(:first_player) { Player.new('alex', 'O') }
      let(:second_player) { Player.new('amanda', 'X') }

      before do
        allow(main_play).to receive(:print)
        allow(main_play).to receive(:gets).and_return(first_player, second_player, '1', '4', '2', '5', '3')
      end

      it 'stops the loop' do
        expect(main_play).to receive(:game_over?).and_return(true)
        main_play.play_game(first_player, second_player)
      end
    end
  end
end
