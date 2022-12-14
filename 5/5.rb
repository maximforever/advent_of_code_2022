# input is on lines 1-8
# Ignore line 9
# starting line 11, for each line... "move 1 from 2 to 1"
# -- split on regex, space /w+ space
# -- [0] is count, [1] is from, [2] is to

require 'pry'

class StackMover
  def initialize(file_name)
    @file_name = file_name
  end

  def reset_crates
    crate_lines, instruction_lines = File.read(@file_name).split("\n\n")
    @crates = create_crates_from_text(crate_lines)
    @instructions = create_instructions_from_text(instruction_lines)
  end

  def create_crates_from_text(text)
    current_slot = 0
    lines = text.split("\n")
    total_crates = lines.last.split(" ").length

    crates = Array.new(total_crates) {Array.new}
    lines = lines.first(lines.length - 1).reverse

    lines.each do |line|
      characters = line.chars.each_slice(4).map(&:join).map{ |slice| slice.match(/\w/).to_a.first }
      characters.each do |char|
        crates[current_slot] << char unless char.nil?

        if current_slot == total_crates - 1
          current_slot = 0
        else
          current_slot +=1
        end
      end
    end

    crates
  end

  def create_instructions_from_text(text)
    text.split("\n").map do |line|
      _, count, from, to = line.split(/[a-z]+\s/).map(&:to_i)
      # stacks are numbered from 1, while we use zero indexing
      [count.to_i, from.to_i - 1, to.to_i - 1]
    end
  end

  def complete_instructions(new_model = false)
    reset_crates

    @instructions.each do |instruction|
      new_model ? complete_one_instruction_on_new_model(instruction) : complete_one_instruction(instruction)
    end

    top_row = @crates.map { |crate| crate.last}.join()
  end

  def complete_one_instruction(instruction)
    # old model moves crates one at a time
    count, from, to = instruction

    count.times do
      @crates[to] << @crates[from].pop
    end
  end

  def complete_one_instruction_on_new_model(instruction)
    # new model moves crates all at the same time
    count, from, to = instruction

    @crates[to] << @crates[from].pop(count)
    @crates[to] = @crates[to].flatten
  end
end

counter = StackMover.new('input.txt')
p counter.complete_instructions(false)
p counter.complete_instructions(true)