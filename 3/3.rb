require 'pry'

# a rucksack is a backpack
class Rucksacker
  def initialize(file_name)
    @rucksacks = File.read(file_name).split("\n")
  end

  def get_priority_sum
    total = 0

    @rucksacks.each do |sack|
      sack_arr = sack.split("")

      first_compartment = sack_arr[0..(sack_arr.size/2-1)]
      second_compartment = sack_arr[(sack_arr.size/2)..sack_arr.size]
      common_item = first_compartment & second_compartment
      total += get_priority(common_item.first)
    end

    total
  end

  def get_common_element
    total = 0

    @rucksacks.each_slice(3) do |slice|
      common_item = slice[0].split("") & slice[1].split("") & slice[2].split("")
      total += get_priority(common_item.first)
    end

    total
  end

  def get_priority(item)
    # lowercase ord is 97-122, uppercase is 65-90, so < 91 is uppercase
    # score needs to be 1-26 for lowercase, 27+ for uppercase, hence adding 26
    item.ord < 91 ? item.ord - 64 + 26 : item.ord - 96
  end
end

rucksacker = Rucksacker.new('input.txt')
p rucksacker.get_priority_sum
p rucksacker.get_common_element