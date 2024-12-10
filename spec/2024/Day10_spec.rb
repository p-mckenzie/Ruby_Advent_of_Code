require 'rspec'
require '2024/Day10'

RSpec.describe Y2024::Day10 do
    let(:example) { 
"89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732" 
    }
    let(:subject) { Y2024::Day10.new(example) }
    
    describe '#finds trails' do
        context 'when given example from webpage' do

            it 'scores trailheads (36)' do
                expect(subject.part_1).to eq 36
            end

            it 'rates trailheads (81)' do
                expect(subject.part_2).to eq 81
            end
        end
    end
end
