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

  def my_select
    if block_given?
      result = []
      my_each {|elem| result.push(elem) if yield elem}
      return result
    else
      puts "No block given"
    end
  end

  def my_all?
    if block_given?
      holding_array = []
      my_each do |elem| 
        if yield elem
          holding_array.push(elem)
        end
      end
      if holding_array.length == self.length
        return true
      else
        return false
      end
      #self.all? {|elem| yield elem} # This is probably cheating...
    else
      puts "No block given"
    end
  end

  def my_any?
    if block_given?
      holding_array = []
      my_each do |elem| 
        if yield elem
          holding_array.push(elem)
        end
      end
      if holding_array.length > 0
        return true
      else
        return false
      end
    else
      puts "No block given"
    end
  end

  def my_none?
    if block_given?
      holding_array = []
      my_each {|elem| holding_array.push(elem) if yield elem}
      p holding_array.length
      if holding_array.length > 0
        return false
      else
        return true
      end
    else
      puts "No block given"
    end
  end

  def my_count
    if block_given?
      i = 0
      my_each {|elem| i += 1 if yield elem}
      return i
    else
      return self.size
    end
  end

  def my_map
    if block_given?
      result_array = []
      my_each do |elem| 
        new_elem = yield elem
        result_array.push(new_elem)
      end
      return result_array
    else
      'No block given'
    end
  end

  def my_inject(i)
    if block_given?
      my_each do |elem| 
        i = yield elem, i
      end
      return i
    else
      'No block given'
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self do
      yield elem
    end
    return self
  end
end
