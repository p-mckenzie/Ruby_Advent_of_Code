require_relative '../Base.rb'

module Y2021
  class Day21 < Base
    @@day = 21
    @@year = 2021

    def initialize(data=get_data)
      @deterministic_die = 0
      @initial_positions = data.scan(/[-\d]+/).map(&:to_i).values_at(1,3)
      
      @rolls_frequency = (1..3).to_a.repeated_permutation(3).map(&:sum).group_by(&:itself).transform_values(&:count)
    end

    def deterministic_turn(player)
      movement = (0..2).map {deterministic_die_roll}
      movement = movement.sum
      @positions[player] = (@positions[player]+movement-1)%10+1

      @score[player] += @positions[player]
    end

    def deterministic_die_roll
      @die_rolls += 1
      @deterministic_die = (@deterministic_die % 100) + 1
      @deterministic_die
    end

    def compute_part_1
      @score = [0,0]
      @winner = nil
      @die_rolls = 0
      @positions = @initial_positions.clone

      catch :complete do
        loop do
          (0...@score.length).each {
            |player|
            deterministic_turn(player)
            if @score[player] >= 1000 then
              @winner = player
              throw :complete
            end
          }
        end
      end
      
      @part_1 =  @score.min*@die_rolls
    end

    def compute_part_2
      @wins = [0,0]
      @states = Hash.new(0)
      # states key: 
      # [[play 1 pos, player 1 score], 
      #  [player 2 pos, player 2 score]
      # ]
      @states[@initial_positions.zip([0,0]) << 0] = 1

      while @states.length > 0 do
        next_states = Hash.new(0)
        @states.each {
          |state, num_universes|
  
          @rolls_frequency.each {
            |roll, occurrences|
            # try player 1 first
            new_position_1 = (state[0][0] + roll - 1) % 10 + 1
            new_score_1 = state[0][1] + new_position_1
            universes_1 = num_universes * occurrences
            if new_score_1 >= 21 then
              # player 1 wins
              @wins[0] += universes_1
            else
              # roll for player 2
              @rolls_frequency.each {
                |roll_2, occurrences_2|
                new_position_2 = (state[1][0] + roll_2 - 1) % 10 + 1
                new_score_2 = state[1][1] + new_position_2
                universes_2 = universes_1 * occurrences_2
                if new_score_2 >= 21 then
                  # player 2 wins
                  @wins[1] += universes_2
                else
                  # log states to loop again (additional turns)
                  new_state = [[new_position_1, new_score_1], [new_position_2, new_score_2]]
                  next_states[new_state] += universes_2
                end
              }
            end
          }
        }
        @states = next_states
      end

      @part_2 = @wins.max
    end

    def part_1
      if not @part_1 then
        compute_part_1
      end
      @part_1
    end

    def part_2
      if not @part_2 then
        compute_part_2
      end
      @part_2
    end
  end
end

executable = Y2021::Day21.new
executable.run