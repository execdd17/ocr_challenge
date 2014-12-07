require 'spec_helper'

class TestParser
  include OcrChallenge::BasicLandAndCellNumberParser
  attr_accessor :lines
end

describe OcrChallenge::BasicLandAndCellNumberParser do

  subject { TestParser.new }

  describe '.parse_numbers' do

    SAMPLE_SIZE.times do
      it 'correctly finds the number' do
        random_number = Faker::PhoneNumber.cell_phone
        subject.lines = [random_number + "\n"]
        numbers       = subject.parse_phone_numbers

        formatted_expected_number = subject.send(:format, random_number, '-')
        numbers.first.should eq formatted_expected_number
      end
    end
  end
end