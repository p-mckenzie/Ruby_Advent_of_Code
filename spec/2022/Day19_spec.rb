require 'rspec'
require '2022/Day19'

RSpec.describe Y2022::Day19 do
    let(:example_data) { 
"Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 2 ore. Each obsidian robot costs 3 ore and 14 clay. Each geode robot costs 2 ore and 7 obsidian.
Blueprint 2: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 8 clay. Each geode robot costs 3 ore and 12 obsidian." 
    }
    let(:subject) { Y2022::Day19.new(example_data) }
    
    describe '#finds quality levels' do
        context 'when given example from webpage' do

            it 'produces appropriate count (33)' do
                expect(subject.part_1).to eq 33
            end
        end
    end

    describe '#multiplies first 3 blueprints geodes' do
        context 'when given example from webpage' do

            it 'produces appropriate count (3472)' do
                expect(subject.part_2).to eq 3472
            end
        end
    end
end
