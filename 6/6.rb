require 'pry'

class Communicator
  def initialize(file_name)
    @string = File.read(file_name)
  end

  def find_start_marker(length, i=length)
    substring = @string[i-(length-1)..i].split("")
    if substring == substring.uniq
      # instruction strings start at 1, ours at 0
      "the marker of length #{length} is at #{i+1}: #{substring.join()}"
    else
      if i == @string.length - 1
        puts "no marker found"
      else
        find_start_marker(length, i+1)
      end
    end
  end
end

communicator = Communicator.new('input.txt')
communicator.find_start_marker(4)
communicator.find_start_marker(14)