require 'rspec'
require '2023/Day16'

RSpec.describe Y2023::Day16 do
    let(:example) { 
'.|...\\....
|.-.\\.....
.....|-...
........|.
..........
.........\\
..../.\\\\..
.-.-/..|..
.|....-|.\\
..//.|....'
    }
    let(:subject) { Y2023::Day16.new(example) }
    
    describe '#calculates light beam paths' do
        context 'when given example from webpage' do

            it 'produces appropriate count (46)' do
                expect(subject.part_1).to eq 46
            end
        end
    end
    describe '#calculates optimal light beam path' do
        context 'when given example from webpage' do
            it 'produces appropriate sum (51)' do
                expect(subject.part_2).to eq 51
            end
        end
    end
end
