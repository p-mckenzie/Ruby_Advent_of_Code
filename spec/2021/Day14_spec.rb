require 'rspec'
require '2021/Day14'

RSpec.describe Y2021::Day14 do
    let(:example_data) { 
"NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C" 
    }
    let(:subject) { Y2021::Day14.new(example_data) }
    
    describe '#calculates number of polymers after 10 cycles' do
        context 'when given example from webpage' do

            it 'produces appropriate count (1588)' do
                expect(subject.part_1).to eq 1588
            end
        end
    end

    describe '#calculates number of polymers after 40 cycles' do
        context 'when given example from webpage' do

            it 'produces appropriate count (2188189693529)' do
                expect(subject.part_2).to eq 2188189693529
            end
        end
    end
end
