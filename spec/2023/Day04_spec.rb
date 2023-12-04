require 'rspec'
require '2023/Day04'

RSpec.describe Y2023::Day04 do
    let(:example) { 
"Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11" 
    }
    let(:subject) { Y2023::Day04.new(example) }
    
    describe '#calculates scratchcard points' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (13)' do
                expect(subject.part_1).to eq 13
            end
        end
    end

    describe '#adds up number of scratchcards' do
        context 'when given example from webpage' do

            it 'produces appropriate product (30)' do
                expect(subject.part_2).to eq 30
            end
        end
    end
end
