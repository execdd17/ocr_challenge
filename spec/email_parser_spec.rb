require 'spec_helper'

class TestParser
  include OcrChallenge::EmailParser
  attr_accessor :lines
end

describe OcrChallenge::EmailParser do

  subject { TestParser.new }

  describe '.parse_email_addresses' do

    SAMPLE_SIZE.times do
      it 'correctly finds the email' do
        random_email    = Faker::Internet.email
        subject.lines   = [random_email + "\n"]
        email_addresses = subject.parse_email_addresses

        email_addresses.first.should eq random_email
      end
    end
  end
end

