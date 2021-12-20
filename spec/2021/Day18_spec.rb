require 'rspec'
require '2021/Day18'

reduce_examples = {"[1,1]
[2,2]
[3,3]
[4,4]" => [[[[1,1],[2,2]],[3,3]],[4,4]],
"[1,1]
[2,2]
[3,3]
[4,4]
[5,5]" => [[[[3,0],[5,3]],[4,4]],[5,5]],
"[1,1]
[2,2]
[3,3]
[4,4]
[5,5]
[6,6]" => [[[[5,0],[7,4]],[5,5]],[6,6]],
"[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
[7,[5,[[3,8],[1,4]]]]
[[2,[2,2]],[8,[8,1]]]
[2,9]
[1,[[[9,3],9],[[9,0],[0,7]]]]
[[[5,[7,4]],7],1]
[[[[4,2],2],6],[8,7]]" => [[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]
}

examples = {"[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]" => 4140,
"[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
[[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
[[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
[7,[5,[[3,8],[1,4]]]]
[[2,[2,2]],[8,[8,1]]]
[2,9]
[1,[[[9,3],9],[[9,0],[0,7]]]]
[[[5,[7,4]],7],1]
[[[[4,2],2],6],[8,7]]" => 3488,
}

permutation_examples = {"[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]" => 3993}

RSpec.describe Y2021::Day18 do
    def self.test_reduce(input, result)
        subject = Y2021::Day18.new(data=input)
        describe '#correctly reduces snailfish number' do
            it "produces appropriate number (#{result})" do
                subject.calc_part_1
                expect(subject.snailfish_num).to eq(result)
            end
        end
    end
    
    def self.test_magnitude(input, result)
        subject = Y2021::Day18.new(data=input)
        describe '#calculates magnitude of reduced snailfish number' do
            it "produces appropriate magnitude (#{result})" do
                expect(subject.part_1).to eq(result)
            end
        end
    end

    def self.test_permute(input, result)
        subject = Y2021::Day18.new(data=input)
        describe '#calculates largest magnitude of any 2-element snailfish number' do
            it "produces appropriate magnitude (#{result})" do
                expect(subject.part_2).to eq(result)
            end
        end
    end
    
    reduce_examples.each {
        |example_data, result|
        self.test_reduce(example_data, result)
    }

    examples.each {
        |example_data, result|
        self.test_magnitude(example_data, result)
    }

    permutation_examples.each {
        |example_data, result|
        self.test_permute(example_data, result)
    }
end
