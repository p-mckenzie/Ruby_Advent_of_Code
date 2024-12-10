require 'rspec'
require '2024/Day09'

RSpec.describe Y2024::Day09 do
    let(:example) { 
"2333133121414131402" 
    }
    let(:subject) { Y2024::Day09.new(example) }
    
    describe '#reformats disk' do
        context 'when given example from webpage' do

            it 'calculates checksum after condensing (1928)' do
                expect(subject.part_1).to eq 1928
            end

            it 'moves whole chunks (2858)' do
                expect(subject.part_2).to eq 2858
            end
        end
    end
end
