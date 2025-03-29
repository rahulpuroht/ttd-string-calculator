class StringCalculator

  DEFAULT_DELIMITERS = /[\n,]/
  CUSTOM_DELIMITERS = /\/\/(.){0,1}\n/

  def add(numbers)
    result=0
    validate(numbers)
    return result if numbers.empty?
    result = sanitize_input(numbers).sum
    result
  end

  private

    def validate(n)
      raise ArgumentError unless n.is_a?(String)
    end

    def sanitize_input(str)
      list = check_delimitier(str).map(&:to_i)
      validate_negative(list)
      list
    end

    def check_delimitier(str)
      num_list = []
      matches = CUSTOM_DELIMITERS.match(str)
      if matches
        delimiter = matches[1]
        str_ith_delimiter = str.split(/[\n]/)[1]
        numbers_list = str_ith_delimiter.split(delimiter)
      else
        numbers_list = str.split(DEFAULT_DELIMITERS)
      end
    end

    def validate_negative(numbers)
      negative_num = numbers.select{|num| num < 0}
      raise ArgumentError, "negative numbers not allowed: #{negative_num.join(', ')}" if negative_num.any?
    end
end