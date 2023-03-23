module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    if block_given?
      for elem in self do
        yield elem, i
        i += 1
      end
      return self
    else
      puts "No block given"
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  # Define my_each here
  def my_each
    for elem in self do
      yield elem
    end
    return self
  end
end
