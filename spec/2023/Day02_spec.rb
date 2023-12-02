require 'rspec'
require '2023/Day02'

RSpec.describe Y2023::Day02 do
    let(:example) { 
"Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green" 
    }
    let(:subject) { Y2023::Day02.new(example) }
    
    describe '#finds possible bag configurations' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (8)' do
                expect(subject.part_1).to eq 8
            end
        end
    end

    describe '#finds power of sets' do
        context 'when given example from webpage' do

            it 'produces appropriate product (2286)' do
                expect(subject.part_2).to eq 2286
            end
        end
    end
end
