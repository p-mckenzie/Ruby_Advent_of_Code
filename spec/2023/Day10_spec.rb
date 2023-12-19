require 'rspec'
require '2023/Day10'

RSpec.describe Y2023::Day10 do
    let(:example_1) { 
"7-F7-
.FJ|7
SJLL7
|F--J
LJ.LJ" 
    }
    let(:subject_1) { Y2023::Day10.new(example_1) }
   
    describe '#finds looped pipe' do
        context 'when given example from webpage' do
            it 'produces appropriate length (8)' do
                expect(subject_1.part_1).to eq 8
            end
        end
    end    
    
    let(:example_2) { 
"...........
.S-------7.
.|F-----7|.
.||.....||.
.||.....||.
.|L-7.F-J|.
.|..|.|..|.
.L--J.L--J.
..........." 
            }
            let(:subject_2) { Y2023::Day10.new(example_2) }
           
            describe '#finds area in looped pipe' do
                context 'when given example from webpage' do
                    it 'produces appropriate area (4)' do
                        expect(subject_2.part_2).to eq 4
                    end
                end
            end
end
