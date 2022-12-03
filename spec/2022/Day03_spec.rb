require 'rspec'
require '2022/Day03'

RSpec.describe Y2022::Day03 do
    let(:example_data) { 
"vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw" 
    }
    let(:subject) { Y2022::Day03.new(example_data) }
    
    describe '#produces sum of item priorities' do
        context 'when given example from webpage' do

            it 'produces appropriate count (157)' do
                expect(subject.part_1).to eq 157
            end
        end
    end

    describe '#produces sum of group badges' do
        context 'when given example from webpage' do

            it 'produces appropriate count (70)' do
                expect(subject.part_2).to eq 70
            end
        end
    end
end
