require 'tarzan/games/rock_paper_scissors/move'

module Tarzan
  module RockPaperScissors
    describe Move do
      describe '<=>' do
        context 'given a hand of Rock' do
          let (:move_p1) { Move.new hand: 'R' }

          context 'versus a hand of Scissors' do
            let (:move_p2) { Move.new hand: 'S'}
            it { expect(move_p1 <=> move_p2).to eq 1}
          end

          context 'versus a hand of Paper' do
            let (:move_p2) { Move.new hand: 'P'}
            it { expect(move_p1 <=> move_p2).to eq -1}
          end

          context 'versus a hand of Rock' do
            let (:move_p2) { Move.new hand: 'R'}
            it { expect(move_p1 <=> move_p2).to eq 0}
          end
        end
      end
    end
  end
end