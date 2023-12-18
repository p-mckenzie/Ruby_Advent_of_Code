require 'rspec'
require '2023/Day18'

RSpec.describe Y2023::Day18 do
    let(:example) { 
"R 6 (#70c710)
D 5 (#0dc571)
L 2 (#5713f0)
D 2 (#d2c081)
R 2 (#59c680)
D 2 (#411b91)
L 5 (#8ceee2)
U 2 (#caa173)
L 1 (#1b58a2)
U 2 (#caa171)
R 2 (#7807d2)
U 3 (#a77fa3)
L 2 (#015232)
U 2 (#7a21e3)" 
    }
    let(:subject) { Y2023::Day18.new(example) }

    describe '#shoelace algorithm' do
    it 'does the wiki example' do
        corners = [[1,6], [3,1], [7,2], [4,4], [8,5], [1,6]]
        expect(subject.shoelace(corners)).to eq 16.5
        end
        it 'does the 2nd wiki example' do
            corners = [[3,1], [7,2], [4,4],[8,6],[1,7],[3,1]]
            expect(subject.shoelace(corners)).to eq 20.5
        end
    end
    
    describe '#counts area of lava' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (62)' do
                expect(subject.part_1).to eq 62
            end

            it 'produces appropriate sum (952408144115)' do
                expect(subject.part_2).to eq 952408144115
            end
        end
    end
end
