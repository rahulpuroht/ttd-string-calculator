require './string_calculator'
RSpec.describe StringCalculator do


  describe "string calculator instance" do
    before do
      @cal = StringCalculator.new
    end
    it "should have creates object of type string calculator" do
      expect(@cal).to be_kind_of(StringCalculator)
    end
    it "should have to raise ArgumentError if string is not passed" do
      expect{@cal.add(1)}.to raise_error(ArgumentError)
    end
    it "should have sanitize_input private method" do
      result = @cal.send(:sanitize_input, "1,2")
      expect(result).to eq([1,2])
    end
    it "should have sanitize_input private method  handle new lines between numbers" do
      result = @cal.send(:sanitize_input, "1,2\n3")
      expect(result).to eq([1,2,3])
    end
    it "should have sanitize_input private method  handle Support different delimiters" do
      result = @cal.send(:sanitize_input, "//;\n1;2")
      expect(result).to eq([1,2])
    end
    it "should have check_delimitier private method" do
      result = @cal.send(:check_delimitier, "1,2\n3")
      expect(result).to eq(["1", "2", "3"])
    end
    it "should have validate_negative private method" do
      result = @cal.send(:validate_negative, [1,2])
      expect(result).to eq(nil)
    end

  end


  describe 'add' do
    before do
      @cal = StringCalculator.new
    end
    it 'returns 0 if input is blank' do
      expect(@cal.add("")).to eq(0)
    end
    it 'returns output when input is single digit in string' do
      expect(@cal.add("1")).to eq(1)
    end
    it 'returns output when input is two digit in string' do
      expect(@cal.add("1,2")).to eq(3)
    end
    it 'returns output when input is multiple digit in string' do
      expect(@cal.add("1,2,3,4")).to eq(10)
    end
    it 'returns output when input is multiple digit in string' do
      expect(@cal.add("1,2,3,4,56,89,100")).to eq(255)
    end
    it 'returns output when input is new lines between numbers' do
      expect(@cal.add("1,2\n3,4")).to eq(10)
    end
    it 'returns output when input is multiples for new lines between numbers' do
      expect(@cal.add("1,\n2\n3,4")).to eq(10)
    end
    it 'returns output when input is with different delimiters' do
      expect(@cal.add("//;\n1;2;3;4")).to eq(10)
    end
    it 'returns output when input is with different delimiters' do
      expect(@cal.add("//$\n1$2$3$4")).to eq(10)
    end
    it 'returns output when input is with different delimiters' do
      expect(@cal.add("//^\n1^2^3^4")).to eq(10)
    end
    it "throws an exception if negative numbers are passed" do
      expect{@cal.add("1,2,-3")}.to raise_error(ArgumentError, 'negative numbers not allowed: -3')
    end

  end
end