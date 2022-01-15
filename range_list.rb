require 'byebug'
require './validate/validate_add_params'
class RangeList
  attr_accessor :implement

  def initialize(implement = [])
    @implement = implement
  end

  def add(range)
    ::Validate::ValidateAddParams.new(range).execute

  # TODO
  end

  def remove
  #TODO
  end

  def print
    # TODO
  end
end

