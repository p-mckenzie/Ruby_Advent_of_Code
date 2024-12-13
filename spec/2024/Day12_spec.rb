require 'rspec'
require '2024/Day12'

RSpec.describe Y2024::Day12 do
    let(:example) { 
"RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE" 
    }
    let(:subject) { Y2024::Day12.new(example) }
    
    describe '#maps gardens' do
        context 'when given example from webpage' do

            it 'calculates fence price (1930)' do
                expect(subject.part_1).to eq 1930
            end

            it 'calculates discounted price (1206)' do
                expect(subject.part_2).to eq 1206
            end
        end
    end
end
