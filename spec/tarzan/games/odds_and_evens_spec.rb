require 'tarzan/games/odds_and_evens'

module Tarzan
  describe 'OddsAndEvens.compare_moves' do
    context 'given a first hand of 3 fingers' do
      let (:move_a) { 3 }

      context 'versus a second hand of 4 fingers' do
        let (:move_b) { 4 }
        it { expect(OddsAndEvens.compare_moves move_a, move_b).to eq 1}
      end

      context 'versus a second hand of 5 fingers' do
        let (:move_b) { 5 }
        it { expect(OddsAndEvens.compare_moves move_a, move_b).to eq -1}
      end
    end
  end
end