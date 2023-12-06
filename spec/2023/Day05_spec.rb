require 'rspec'
require '2023/Day05'

RSpec.describe Y2023::Day05 do
    let(:example) { 
"seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4" 
    }
    let(:subject) { Y2023::Day05.new(example) }
    
    describe '#calculates lowest initial seed number' do
        context 'when given example from webpage' do

            it 'produces appropriate number (35)' do
                expect(subject.part_1).to eq 35
            end
        end
    end

    describe "#zoom_in does what it needs to" do
        it 'adjusts offset with overlap' do
            seed = Y2023::SeedState.new(79..79)
            result = subject.zoom_in(seed)
            expect(result).to be_an_instance_of(Array)
            expect(result.length).to eq 1
            expect(result.first.range).to eq 81..81
        end
        it 'moves forward when no overlap' do
            seed = Y2023::SeedState.new(81..81, 'soil')
            result = subject.zoom_in(seed)
            expect(result).to be_an_instance_of(Array)
            expect(result.length).to eq 1
            expect(result.first.range).to eq 81..81
        end
        it 'splits first side with partial overlap' do
            seed = Y2023::SeedState.new(35..81)
            result = subject.zoom_in(seed)
            expect(result).to be_an_instance_of(Array)
            expect(result.length).to eq 2

            expect(result.first.range).to eq 35..49

            expect(result.last.range).to eq 52..83
        end
        it 'splits second side with partial overlap' do
            seed = Y2023::SeedState.new(48..51)
            result = subject.zoom_in(seed)
            expect(result).to be_an_instance_of(Array)
            expect(result.length).to eq 2

            expect(result.first.range).to eq 48..49

            expect(result.last.range).to eq 52..53
        end
        it 'splits both sides with partial overlap' do
            seed = Y2023::SeedState.new(35..200, 'seed')
            result = subject.zoom_in(seed)
            expect(result).to be_an_instance_of(Array)
            expect(result.length).to eq 3

            first = result[0]
            expect(first.state).to eq 'seed'
            expect(first.range).to eq 35..97

            mid = result[1]
            expect(mid.state).to eq 'soil'
            expect(mid.range).to eq 50..51

            last = result[2]
            expect(last.state).to eq 'seed'
            expect(last.range).to eq 100..200
        end
        it 'fixed the weird thing at temperature' do
            seed = Y2023::SeedState.new(45..45, 'temperature')
            result = subject.zoom_in(seed)
            expect(result).to be_an_instance_of(Array)

            expect(result.first.range).to eq 46..46
        end
    end

    describe '#lowest seed for ranges' do
        context 'when given example from webpage' do

            it 'produces appropriate number (46)' do
                expect(subject.part_2).to eq 46
            end
        end
    end
end
