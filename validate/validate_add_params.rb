module  Validate
  class ValidateAddParams

    class RangeListParamsError < StandardError; end

    attr_reader :params

    def initialize(add_params)
      @params = add_params.dup
    end

    def execute
      validate_type
      validate_length
      validate_range
    end

    private
    def validate_type
      raise RangeListParamsError, "Type error This method need Array params" unless params.is_a?(Array)
    end

    def validate_length
      raise RangeListParamsError, "Size error params size only <= 2" if params.size <= 1 || params.size >= 3
    end

    def validate_range
      if params.last - params.first <= 0
        raise RangeListParamsError, "Range error need to: value > come: value, likie [3, 10], [5,10]"
      end
    end

  end
end