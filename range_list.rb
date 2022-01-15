require 'byebug'
require './validate/validate_add_params'
class RangeList

  attr_reader :implement, :current_implement_hash

  def initialize(implement = [])
    @implement = implement
    @current_implement_hash = {}
  end

  # key_* 0, 1, 2, 3, ++ ....
  def add(range)
    ::Validate::ValidateAddParams.new(range).execute
    if current_implement_hash.empty?
      @current_implement_hash = {key_0: {come: range.first, to: range.last}}
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

  private

  attr_writer :implement, :current_implement_hash

  def compara_and_build_new(range)
    # TODO: Add compara logic

  end

  def format_range_lists
    range_lists_string = ""

    current_implement_hash.each_value do |value|
      range_lists_string << "[ #{value[:come]}, #{value[:to]} ) "
    end

    range_lists_string
  end
end

