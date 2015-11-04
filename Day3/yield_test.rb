require 'pry'

class Array
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i +=1
    end
    self
  end

  def my_select
    i = 0
    new_array = []
    while i < self.size
      if yield(self[i])
        new_array << self[i]
      end
      i +=1
    end
    new_array
  end

  def my_select_correct
    return self unless block_given?
    new_array = []
    my_each { |i| new_array << i if yield(i) }
    new_array
  end

  def my_map
    new_array = []
    my_each { |i| new_array << yield(i) }
    new_array
  end

  def my_map_proc proc
    new_array = []
    each { |i| new_array << proc.call(i) }
    new_array
  end

  def my_reduce
    i = 0
    while i < self.size
      yield(self[i], i)
      i +=1
    end
    self
  end

end


my_proc = Proc.new { |item| item * 2 }
[1,2,3].my_map_proc my_proc




binding.pry