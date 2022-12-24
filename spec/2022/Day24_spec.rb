require 'rspec'
require '2022/Day24'

RSpec.describe Y2022::Day24 do
    let(:example_data) { 
"#.######
#>>.<^<#
#.<..<<#
#>v.><>#
#<^v^^>#
######.#" 
    }
    let(:subject) { Y2022::Day24.new(example_data) }
    
    describe '#finds time to reach destination' do
        context 'when given example from webpage' do

            it 'produces appropriate count (18)' do
                expect(subject.part_1).to eq 18
            end
        end
    end

    describe '#makes 3 trips' do
        context 'when given example from webpage' do

            it 'produces appropriate count (54)' do
                expect(subject.part_2).to eq 54
            end
        end
    end
end
