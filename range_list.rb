require 'byebug'
require './validate/validate_add_params'
class RangeList
  attr_reader :implements, :range_lists_string

  def initialize(implement = [])
    @implements = implement
    @range_lists_string = ""
  end

  def indexs(index)
    implements[index]
  end

  ['size', 'length'].each do |name|
    define_method "range_#{name}" do
      implements.size
    end
  end

  def add(range)
    ::Validate::ValidateAddParams.new(range).execute
    compara_and_build_new(range)
  end

  def remove(range)
    ::Validate::ValidateAddParams.new(range).execute
    # compara_and_remove(range)
  end

  def print
    p format_range_lists
  end

  private

  attr_writer :implements, :range_lists_string

  def compara_and_build_new(range)
    update_ranges = range
    implements_ranges = []
    rest_ranges = []
    return implements << update_ranges if implements.empty?

    implements.each_with_index do |implement, index|
      compara_code = compara_code(range, implement)
      case compara_code
      when -1
        implements_ranges << implement
        next
      when 0
        update_ranges = update_implements_with_index(range, index)
        next
      when 1
        rest_ranges = implements.delete_at(index)
        break
      end
    end

    implements_ranges << update_ranges
    implements_ranges << rest_ranges
    implements_ranges.delete_if { |item| item.empty? }

    @implements = implements_ranges
    @range_lists_string = ""
  end

  def update_implements_with_index(item, index)
    new_items_first = [implements[index].first, item.first].min
    new_items_last = [implements[index].last, item.last].max
    [new_items_first, new_items_last]
  end

  def compara_code(range, implement)
    return 1 if (range.last < implement.first) # [1,2] [3,5] 
    return -1 if (range.first > implement.last) # [3, 5] [1, 2]
    0
  end

  def format_range_lists
    @implements.each do |implement|
      range_lists_string << "[ #{implement.first}, #{implement.last} ) "
    end

    range_lists_string
  end
end

