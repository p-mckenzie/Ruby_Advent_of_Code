require 'rspec'
require '2021/Day10'

RSpec.describe Y2021::Day10 do
    let(:example_data) { "[({(<(())[]>[[{[]{<()<>>
    [(()[<>])]({[<{<<[]>>(
    {([(<{}[<>[]}>{[]{[(<()>
    (((({<>}<{<{<>}{[]{[]{}
    [[<[([]))<([[{}[[()]]]
    [{[{({}]{}}([{[{{{}}([]
    {<[[]]>}<{[{[{[]{()[[[]
    [<(<(<(<{}))><([]([]()
    <{([([[(<>()){}]>(<<{{
    <{([{{}}[<[[[<>{}]]]>[]]"
    }
    let(:subject) { Y2021::Day10.new(example_data) }
    
    describe '#calculates points from syntax errors' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (26397)' do
                expect(subject.part_1).to eq 26397
            end
        end
    end

    describe '#calculates points from autocompletep' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (288957)' do
                expect(subject.part_2).to eq 288957
            end
        end
    end
end
