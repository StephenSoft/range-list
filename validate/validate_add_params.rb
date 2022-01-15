module  Validate
  class ValidateAddParams

    class RangeListParamsError < StandardError; end

    attr_reader :params

    def initialize(add_params)
      @params = add_params.dup
    end

    def execute
      validate_type(params)
      validate_length(params.size)
    end

    private

    def validate_length(length)
      raise RangeListParamsError, "Size error params size only <= 2" if length <= 1 || length >= 3
    end

    def validate_type(params)
      raise RangeListParamsError, "Type error This method need Array params" unless params.is_a?(Array)
    end

  end
end