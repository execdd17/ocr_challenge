require 'spec_helper'

class TestParser
  include OcrChallenge::NameParser
  attr_accessor :lines
end

describe OcrChallenge::NameParser do

  subject { TestParser.new }

  describe '.parse_names' do

    #let(:random_name) { Faker::Name.name }
    let(:random_name) { "Alexander Vanadio" }

    SAMPLE_SIZE.times do
      it 'correctly finds the name' do
        subject.lines = [random_name + "\n"]
        names         = subject.parse_names("/home/alex/git_repos/ocr_challenge/names")

        names.first.should eq random_name
      end
    end

    it 'filters a non-name' do
      subject.lines = [random_name + "\n", "Software Engineer\n", "234\n", "\n"]
      names         = subject.parse_names("/home/alex/git_repos/ocr_challenge/names")

      names.size.should be 1
    end
  end
end

