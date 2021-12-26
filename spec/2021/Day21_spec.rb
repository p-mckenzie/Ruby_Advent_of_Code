require 'rspec'
require '2021/Day21'

RSpec.describe Y2021::Day21 do
    let(:example_data) { 
"Player 1 starting position: 4
Player 2 starting position: 8"
    }
    let(:subject) { Y2021::Day21.new(example_data) }
    
    describe "#calculates game winner with detemrinistic die" do
        context 'when given example from webpage' do

            it 'produces appropriate winner product (739785)' do
                expect(subject.part_1).to eq 739785
            end
        end
    end

    describe "#calculates winner with Dirac dice" do
        context 'when given example from webpage' do

            it 'produces appropriate winner product (444356092776315)' do
                expect(subject.part_2).to eq 444356092776315
            end
        end
    end
end