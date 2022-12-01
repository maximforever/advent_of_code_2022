require 'pry'

class CalorieCounter
  def initialize(file_name)
    elf = File.read(file_name).split("\n\n")
    @input_array = elf.map do |line|
      line.split("\n").map {|num| num.to_i }
    end
  end

  def get_max_group_calories
    max = 0;

    @input_array.each do |elf_foods|
      total_calories = elf_foods.sum
      max = [max, total_calories].max
    end

    max
  end

  def get_top_three_group_calories
    total_calories = []

    @input_array.each do |elf_foods|
      total_calories << elf_foods.sum
    end

    total_calories.sort.last(3).sum
  end
end

counter = CalorieCounter.new('input.txt')
counter.get_top_three_group_calories