require 'tarzan/games/rock_paper_scissors'

module Tarzan
  describe 'RockPaperScissors.compare_moves' do
    context 'given a first hand of Rock' do
      let (:move_a) { 'R' }

      context 'versus a second hand of Scissors' do
        let (:move_b) { 'S' }
        it { expect(RockPaperScissors.compare_moves move_a, move_b).to eq 1}
      end

      context 'versus a second hand of Paper' do
        let (:move_b) { 'P' }
        it { expect(RockPaperScissors.compare_moves move_a, move_b).to eq -1}
      end

      context 'versus a second hand of Rock' do
        let (:move_b) { 'R' }
        it { expect(RockPaperScissors.compare_moves move_a, move_b).to eq 0}
      end
    end
  end
end