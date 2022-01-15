require 'byebug'
class RangeList
  attr_accessor :implement

  def initialize(implement = [])
    @implement = implement
  end

  def add(range)
    unless range.is_a?(Array)
      return raise "Type error This method need Array params"
    end
    if range.size <= 1 || range.size >= 3
      raise "Size error params size only <= 2"
    end
    byebug
  # TODO
  end

  def remove
  #TODO
  end

  def print
    # TODO
  end
end

