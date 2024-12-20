require 'rspec'
require '2024/Day19'

RSpec.describe Y2024::Day19 do
    let(:example) { 
"r, wr, b, g, bwu, rb, gb, br

brwrr
bggr
gbbr
rrbgbr
ubwu
bwurrg
brgr
bbrgwb"
    }
    let(:subject) { Y2024::Day19.new(example) }
    
    describe '#Linen Layour' do
        context 'when given example from webpage' do

            it 'finds valid designs (6)' do
                expect(subject.part_1).to eq 6
            end

            it 'sums valid designs (16)' do
                expect(subject.part_2).to eq 16
            end
        end
    end
end
