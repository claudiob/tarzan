require 'tarzan/games/odds_and_evens/move'

module Tarzan
  module OddsAndEvens
    describe Move do
      describe '<=>' do
        context 'given that victory is on odds and a hand of 3 fingers' do
          let (:move_p1) { Move.new wins_on_odds: true, fingers: 3 }

          context 'versus a hand of 4 fingers' do
            let (:move_p2) { Move.new wins_on_odds: false, fingers: 4 }
            it { expect(move_p1 <=> move_p2).to eq 1}
          end

          context 'versus a hand of 5 fingers' do
            let (:move_p2) { Move.new wins_on_odds: false, fingers: 5 }
            it { expect(move_p1 <=> move_p2).to eq -1}
          end
        end
      end
    end
  end
end