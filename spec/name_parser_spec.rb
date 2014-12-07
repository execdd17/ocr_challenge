require 'spec_helper'

class TestParser
  include OcrChallenge::NameParser
  attr_accessor :lines
end

describe OcrChallenge::NameParser do

  subject { TestParser.new }


  describe '.parse_names' do

    SAMPLE_SIZE.times do
      it 'correctly finds the name' do
        random_name   = Faker::Name.name
        subject.lines = [random_name + "\n"]
        names         = subject.parse_names("/home/alex/git_repos/ocr_challenge/names")

        names.first.should eq random_name
      end
    end
  end
end

