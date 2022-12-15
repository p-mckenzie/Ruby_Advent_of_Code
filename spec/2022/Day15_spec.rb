require 'rspec'
require '2022/Day15'

RSpec.describe Y2022::Day15 do
    let(:example_data) { 
"Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3" 
    }
    let(:subject) { Y2022::Day15.new(example_data, 20) }
    
    describe '#counts positions that cannot be beacons' do
        context 'when given example from webpage' do

            it 'produces appropriate count (26)' do
                expect(subject.part_1).to eq 26
            end
        end
    end

    describe '#computing tuning frequency' do
        context 'when given example from webpage' do

            it 'produces appropriate count (12000010)' do
                expect(subject.part_2).to eq 12000010
            end
        end
    end
end
