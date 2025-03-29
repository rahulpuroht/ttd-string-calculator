class StringCalculator

  

  def add(numbers)
    result=0
    validate(numbers)
    return result if numbers.empty?
    list = sanitize_input(numbers)
    result = list.sum
    result
  end

  private

    def validate(n)
      raise ArgumentError unless n.is_a?(String)
    end

    def sanitize_input(str)
      str.split(",").map(&:to_i)
    end
end