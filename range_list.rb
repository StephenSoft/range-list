require 'byebug'
require './validate/validate_add_params'
class RangeList

  attr_reader :implements, :range_lists_string

  def initialize(implement = [])
    @implements = implement
    @range_lists_string = ""
  end

  # key_* 0, 1, 2, 3, ++ ....
  def add(range)
    ::Validate::ValidateAddParams.new(range).execute
    if implements.empty?
      implements << range
    else
      compara_and_build_new(range)
    end
  end

  def remove
    # TODO: Add remove logic
  end

  def print
    p format_range_lists
  end

  def indexs(index)
    implements[index]
  end

  private

  attr_writer :implements, :range_lists_string

  def compara_and_build_new(range)
    implements.each_with_index do |implement, index|
      if compara_code(range, implement) == -1
        implements << range
        next
      end

      if compara_code(range, implement) == 0
        update_implements_with_index(range, index)
        next
      end
    end
  end

  def update_implements_with_index(item, index)
    new_items_first = [implements[index].first, item.first].min
    new_items_last = [implements[index].last, item.last].max
    implements[index] = [new_items_first, new_items_last]
  end

  def compara_code(range, implement)
    return 1 if (range.last < implement.first) # [1,2] [3,5] 
    return -1 if (range.first > implement.last) # [3, 5] [1, 2]
    0
  end

  def format_range_lists
    implements.each do |implement|
      range_lists_string << "[ #{implement.first}, #{implement.last} ) "
    end

    range_lists_string
  end
end

