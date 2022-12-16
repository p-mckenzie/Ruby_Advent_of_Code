require 'rspec'
require '2022/Day16'

RSpec.describe Y2022::Day16 do
    let(:example_data) { 
"Valve AA has flow rate=0; tunnels lead to valves DD, II, BB
Valve BB has flow rate=13; tunnels lead to valves CC, AA
Valve CC has flow rate=2; tunnels lead to valves DD, BB
Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE
Valve EE has flow rate=3; tunnels lead to valves FF, DD
Valve FF has flow rate=0; tunnels lead to valves EE, GG
Valve GG has flow rate=0; tunnels lead to valves FF, HH
Valve HH has flow rate=22; tunnel leads to valve GG
Valve II has flow rate=0; tunnels lead to valves AA, JJ
Valve JJ has flow rate=21; tunnel leads to valve II" 
    }
    let(:subject) { Y2022::Day16.new(example_data) }
    
    describe '#sums pressure released' do
        context 'when given example from webpage' do

            it 'produces appropriate count (1651)' do
                expect(subject.part_1).to eq 1651
            end
        end
    end

    describe '#walking with elephant' do
        context 'when given example from webpage' do

            it 'produces appropriate count (1707)' do
                expect(subject.part_2).to eq 1707
            end
        end
    end
end
