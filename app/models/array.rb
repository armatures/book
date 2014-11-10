class SoundArray
  def initialize(arr)
    @arr = arr
  end

  def == other
    @arr == other.instance_variable_get('@arr')
  end
  # [[1,2],[3,4]] => [[1,3],[1,4],[2,3],[2,4]]
  def ordered_combine
    return self if @arr.length == 1

    full_arr = []
    @arr[0].each do |item|
      one_step( item, @arr[1] ).each{|i| full_arr << i }
    end

    SoundArray.new(full_arr)
    # first = @arr.shift
     # first.map do |item|
       # [item] << self.ordered_combine
     # end
  end

  def one_step(head, tail)
    tail.each_with_object([]) do |sound, accumulator|
      accumulator << [head,sound].flatten
    end
  end

end
