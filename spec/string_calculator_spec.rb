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

  end


  describe 'add' do
    it 'returns 0 if input is blank' do
      cal = StringCalculator.new
      expect(cal.add("")).to eq(0)
    end
    it 'returns output when input is single digit in string' do
      cal = StringCalculator.new
      expect(cal.add("1")).to eq(1)
    end
    it 'returns output when input is two digit in string' do
      cal = StringCalculator.new
      expect(cal.add("1,2")).to eq(3)
    end
    it 'returns output when input is multiple digit in string' do
      cal = StringCalculator.new
      expect(cal.add("1,2,3,4")).to eq(10)
    end
  end
end