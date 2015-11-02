require 'rspec'

class StringCalc

  def add string
    number_arr = string.gsub("\n",",").split(",")
    result = 0
    number_arr.reduce(0) do |memo, digit|
      result += digit.to_i
    end
  end

end


RSpec.describe "String calculator" do

  before :each do
    @calculator = StringCalc.new
  end

  it "returns 0 for the empty string" do
    expect(@calculator.add("")).to eq(0)
  end

  it "returns 1 for only that number" do
    expect(@calculator.add("1")).to eq(1)
  end

  it "returns 1 for only that number" do
    expect(@calculator.add("1\n2")).to eq(3)
  end

  it "returns 1 for only that number" do
    expect(@calculator.add("1\n2,2")).to eq(5)
  end
end