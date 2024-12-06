require 'rspec'
require '2024/Day05'

RSpec.describe Y2024::Day05 do
    let(:example) { 
"47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47" 
    }
    let(:subject) { Y2024::Day05.new(example) }
    
    describe '#identifies correct printings' do
        context 'when given example from webpage' do

            it 'produces correct page number sum (143)' do
                expect(subject.part_1).to eq 143
            end

            it 'produces sorted page number sum (123)' do
                expect(subject.part_2).to eq 123
            end
        end
    end
end
