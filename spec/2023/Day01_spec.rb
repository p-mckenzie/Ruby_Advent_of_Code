require 'rspec'
require '2023/Day01'

RSpec.describe Y2023::Day01 do
    let(:example_1) { 
"1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet" 
    }
    let(:subject_1) { Y2023::Day01.new(example_1) }
    
    describe '#finds calibration values for trebuchet' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (142)' do
                expect(subject_1.part_1).to eq 142
            end
        end
    end

    let(:example_2) { 
"two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen" 
    }
    let(:subject_2) { Y2023::Day01.new(example_2) }

    describe '#finds calibration with words' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (281)' do
                expect(subject_2.part_2).to eq 281
            end
        end
    end
    let(:from_mine) {
        "8six1ninezjsix"
    }
    let(:subject_3) { Y2023::Day01.new(from_mine) }

    describe '#finds calibration with words' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (86)' do
                expect(subject_3.part_2).to eq 86
            end
        end
    end
end
